package model;
import java.util.*;
public class Updater
{
    protected LinkedList<MyObserver> views = new LinkedList<MyObserver>();
    public Updater()
    {
        
    }
    public void attach(MyObserver o)
    {   
        views.add(o);   
    }  
    public void detach(MyObserver o)
    {   
        views.remove(o);    
    }                
    public void updateViews()
    {   
        for(MyObserver view : views)
            view.update(); 
    }
    
}
