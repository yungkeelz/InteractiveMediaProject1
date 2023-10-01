package model;


public class Pet     //Step 1 - model inherits from Updater
{
    private int id;
    private String name;
    
    public Pet()
    {
    }
    public void set(int id, String name)//procedures that change data MUST call updateViews()
    {
       this.id = id;
       this.name = name;
                    //step 2 - calls update for each observer
    }
    public String toString()
    {
        return "Id: " + id + " name: " + name;
    }
}
