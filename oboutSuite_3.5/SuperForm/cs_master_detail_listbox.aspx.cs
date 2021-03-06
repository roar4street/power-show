﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.SuperForm;
using Obout.ListBox;
public partial class SuperForm_cs_master_detail_listbox : System.Web.UI.Page
{
    private SuperForm SuperForm1;
    protected void Page_Load(object sender, EventArgs e)
    {
        SuperForm1 = new SuperForm();
        SuperForm1.ID = "SuperForm1";
        SuperForm1.Title = "Order Details";
        SuperForm1.DataSourceID = "SqlDataSource2";
        SuperForm1.AutoGenerateRows = false;
        SuperForm1.AutoGenerateInsertButton = true;
        SuperForm1.AutoGenerateEditButton = true;
        SuperForm1.AutoGenerateDeleteButton = true;
        SuperForm1.AutoGenerateDateFields = true;
        SuperForm1.DataKeyNames = new string[] { "OrderID" };
        SuperForm1.AllowPaging = true;
        SuperForm1.DefaultMode = DetailsViewMode.Edit;
        SuperForm1.ItemCommand += SuperForm1_ItemCommand;
        SuperForm1.ItemUpdated += SuperForm1_ItemUpdated;

        Obout.SuperForm.BoundField field1 = new Obout.SuperForm.BoundField();
        field1.DataField = "OrderID";
        field1.HeaderText = "Order ID";
        field1.ReadOnly = true;

        Obout.SuperForm.BoundField field2 = new Obout.SuperForm.BoundField();
        field2.DataField = "ShipName";
        field2.HeaderText = "Ship Name";

        Obout.SuperForm.BoundField field3 = new Obout.SuperForm.BoundField();
        field3.DataField = "ShipCity";
        field3.HeaderText = "Ship City";

        Obout.SuperForm.BoundField field4 = new Obout.SuperForm.BoundField();
        field4.DataField = "ShipRegion";
        field4.HeaderText = "Ship Region";

        Obout.SuperForm.DropDownListField field5 = new Obout.SuperForm.DropDownListField();
        field5.DataField = "ShipCountry";
        field5.HeaderText = "Ship Country";
        field5.DataSourceID = "SqlDataSource3";

        Obout.SuperForm.DateField field6 = new Obout.SuperForm.DateField();
        field6.DataField = "OrderDate";
        field6.HeaderText = "Order Date";
        field6.DataFormatString = "{0:MM/dd/yyyy}";
        field6.ApplyFormatInEditMode = true;

        Obout.SuperForm.DateField field7 = new Obout.SuperForm.DateField();
        field7.DataField = "ShippedDate";
        field7.HeaderText = "Shipped Date";
        field7.DataFormatString = "{0:MM/dd/yyyy}";
        field7.ApplyFormatInEditMode = true;

        Obout.SuperForm.DateField field8 = new Obout.SuperForm.DateField();
        field8.DataField = "RequiredDate";
        field8.HeaderText = "Required Date";
        field8.DataFormatString = "{0:MM/dd/yyyy}";
        field8.ApplyFormatInEditMode = true;

        SuperForm1.Fields.Add(field1);
        SuperForm1.Fields.Add(field2);
        SuperForm1.Fields.Add(field3);
        SuperForm1.Fields.Add(field4);
        SuperForm1.Fields.Add(field5);
        SuperForm1.Fields.Add(field6);
        SuperForm1.Fields.Add(field7);
        SuperForm1.Fields.Add(field8);

        SuperForm1Container.Controls.Add(SuperForm1);
   
    }
    protected void ListBox1_SelectedIndexChanged(object sender, ListBoxItemEventArgs e)
    {
        SqlDataSource2.SelectParameters[0].DefaultValue = e.Item.Value;
        SuperForm1.DefaultMode = DetailsViewMode.Edit;
        SuperForm1.DataBind();
    }

    protected void SuperForm1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            SqlDataSource2.SelectParameters[0].DefaultValue = "0";
            SuperForm1.DataBind();
        }
    }

    protected void SuperForm1_ItemUpdated(object sender, EventArgs e)
    {
        SqlDataSource2.SelectParameters[0].DefaultValue = "0";
        SuperForm1.DataBind();
    }
}
