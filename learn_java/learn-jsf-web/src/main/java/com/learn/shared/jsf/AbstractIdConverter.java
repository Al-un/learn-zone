package com.learn.shared.jsf;

import com.learn.shared.ejb.AbstractEjb;
import com.learn.shared.jpa.AbstractEntity;
import java.io.Serializable;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;

/**
 *
 * @param <E> Entity type
 */
public abstract class AbstractIdConverter<E extends AbstractEntity> implements Converter, Serializable {

    protected abstract AbstractEjb getService();

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        try {
            Long id = Long.parseLong(value);
            Object o = getService().findById(id);
            return o;
        }
        catch (NumberFormatException e) {
            return null;
        }
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        return value != null ? ((E) value).getId().toString() : null;
    }

}
