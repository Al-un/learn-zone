# Generate a post and if necessary related articles
class PostGenerator
  # +post+ argument key
  KEY_POST = :post
  # +article+ argument key
  KEY_ARTICLE = :article
  # +delete+ argument key
  KEY_HELP = :help
  # +date+ argument key
  KEY_DATE = :date
  # +dryrun+ argument key
  KEY_DRYRUN = :dryrun
  # Argument keys are identified with double dashes
  KEY_DETECTOR = '--'
  # Allowed keys to filter irrelevant arguments
  ALLOWED_ARGS = [KEY_POST, KEY_ARTICLE, KEY_HELP, KEY_DRYRUN].freeze
  # Help message to display if input is missing or invalid
  MSG_HELP = <<-END_HELP
      Arguments list is either missing or invalid. Valid arguments are:
        --post {post title}   generate a post with the given title. Spaces are replaced
                              by dashes.
        --article {articles}  link the created post to the articles. Multiple articles
                              may be provided.
        --date {date}         use a custom date. Format must be YYYY-MM-DD. Otherwise
                              today date is used
        --dryrun true         Perform a dryrun and does not create file. The 
                              "true" value is required
        --help                print this help message. Override other arguments 
                              and does not execute any generator
  END_HELP
    .freeze

  # ---------- self
  # Open to self method for convenience purpose
  def self.process
    post_generator = PostGenerator.new
    post_generator.process
  end

  # ---------- methods

  # process the arguments and generate appropriate files
  def process
    parsed_args = parse_arguments
    # +puts+ returns +nil+
    return puts MSG_HELP if requires_help?(parsed_args)

    add_missing_args!(parsed_args)
    puts "proceeding with #{parsed_args}"

    generate_posts(parsed_args)
    generate_articles(parsed_args)
  end

  # parse arguments and check if input is correct
  # @return [Hash] parsed allowed arguments and its values
  def parse_arguments
    ## group bby argument key
    arg_key = nil
    arg_hash = {}
    ARGV.each do |arg|
      # Attempt to extract a new key or use previous key if applicable
      arg_key = extract_arg_key(arg) || arg_key
      if !arg_key.nil? && extract_arg_key(arg).nil?
        arg_hash[arg_key] = (arg_hash[arg_key] || []) << arg
      end
    end

    arg_hash
  end

  # @param [String] arg raw input. Is expected to be starting via KEY_DETECTOR value
  # @return [Symbol] non-nil symbol if input is a valid inlut
  def extract_arg_key(arg)
    # invalid argument key
    return nil unless arg.start_with?(KEY_DETECTOR)

    # Strip KEY_DETECTOR and convert to symbol
    new_key = arg[KEY_DETECTOR.length, arg.length - KEY_DETECTOR.length]
    new_key = new_key.downcase.to_sym
    # Ensure it is valid
    return nil unless ALLOWED_ARGS.include?(new_key)

    # Return argument key
    new_key
  end

  # @param [Hash] args to be tested arguments
  # @return [Boolean] true if "help message" has to be displayed
  def requires_help?(args = {})
    args.empty? || args.key?(KEY_HELP)
  end

  # Adding missing arguments:
  # - date
  # @param [Hash] args initial input
  # @return [Hash] input filled with missing arguments
  def add_missing_args!(args)
    # add today date
    args[KEY_DATE] = Time.new.strftime('%Y-%m-%d') unless args.key?(KEY_DATE)
  end

  def generate_posts(args)
    posts, date, articles = args.values_at(KEY_POST, KEY_DATE, KEY_ARTICLE)
    dryrun = args[KEY_DRYRUN]
    posts.each do |post|
      file_path = "./src/collections/_posts/#{date}-#{post.tr(' ', '-')}.md"
      file_content = "---\ntitle:\narticles:\n"
      articles.each { |art| file_content << "    - #{art.tr(' ', '-')}.md\n" } if articles
      file_content << "---\n"
      if dryrun
        puts "DryRun: create file #{file_path} with content:\n$#{file_content}"
      else
        file = File.new(file_path, 'w')
        file.puts(file_content)
        file.close
        puts "Created: #{file_path}"
      end
    end if posts
  end

  def generate_articles(args)
    posts, date, articles = args.values_at(KEY_POST, KEY_DATE, KEY_ARTICLE)
    dryrun = args[KEY_DRYRUN]
    articles.each do |article|
      file_path = "./src/collections/#{article.tr(' ', '-')}.md"
      file_content = "---\ntitle:#{article.split.map(&:capitalize) * ' '}\n"
      file_content << "mentioned:\n"
      posts.each do |post|
        post_id = "/#{date.tr('-', '/')}/#{post.tr(' ', '-')}"
        file_content << "    - #{post_id}\n"
      end if posts
      file_content << "---\n"
      if dryrun
        puts "DryRun: create file #{file_path} with content:\n$#{file_content}"
      else
        file = File.new(file_path, 'w')
        file.puts(file_content)
        file.close
        puts "Created: #{file_path}"
      end
    end if articles
  end
end
