﻿Imports Obout.SuperForm
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class SuperForm_vb_live_styles_datefield
    Inherits System.Web.UI.Page
    Dim SuperForm1 As Obout.SuperForm.SuperForm
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        SuperForm1 = New SuperForm()
        SuperForm1.ID = "SuperForm1"
        SuperForm1.Title = "Order Details"
        SuperForm1.DataSourceID = "SqlDataSource1"
        SuperForm1.AutoGenerateRows = False
        SuperForm1.AutoGenerateInsertButton = True
        SuperForm1.AutoGenerateEditButton = True
        SuperForm1.AutoGenerateDeleteButton = True
        Dim keyNames1() As String = {"OrderID"}
        SuperForm1.DataKeyNames = keyNames1
        SuperForm1.AllowPaging = True
        SuperForm1.DefaultMode = DetailsViewMode.Edit
        SuperForm1.AllowDataKeysInsert = False

        AddHandler SuperForm1.DataBound, AddressOf SuperForm1_DataBound

        Dim field1 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field1.DataField = "OrderID"
        field1.HeaderText = "Order ID"
        field1.ReadOnly = True
        field1.InsertVisible = False

        Dim field2 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field2.DataField = "ShipName"
        field2.HeaderText = "Ship Name"

        Dim field3 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field3.DataField = "ShipCity"
        field3.HeaderText = "Ship City"

        Dim field4 As Obout.SuperForm.DropDownListField = New Obout.SuperForm.DropDownListField()
        field4.DataField = "ShipCountry"
        field4.DisplayField = "ShipCountry"
        field4.HeaderText = "Country"
        field4.DataSourceID = "SqlDataSource2"

        Dim field5 As Obout.SuperForm.DateField = New Obout.SuperForm.DateField()
        field5.DataField = "OrderDate"
        field5.HeaderText = "Order Date"
        field5.DataFormatString = "{0:MM/dd/yyyy hh:mm}"
        field5.ApplyFormatInEditMode = True

        Dim field6 As Obout.SuperForm.DateField = New Obout.SuperForm.DateField()
        field6.DataField = "ShippedDate"
        field6.HeaderText = "Shipped Date"
        field6.DataFormatString = "{0:MM/dd/yyyy hh:mm}"
        field6.ApplyFormatInEditMode = True

        Dim field7 As Obout.SuperForm.DateField = New Obout.SuperForm.DateField()
        field7.DataField = "RequiredDate"
        field7.HeaderText = "Required Date"
        field7.DataFormatString = "{0:MM/dd/yyyy hh:mm}"
        field7.ApplyFormatInEditMode = True

        SuperForm1.Fields.Add(field1)
        SuperForm1.Fields.Add(field2)
        SuperForm1.Fields.Add(field3)
        SuperForm1.Fields.Add(field4)
        SuperForm1.Fields.Add(field5)
        SuperForm1.Fields.Add(field6)
        SuperForm1.Fields.Add(field7)

        SuperForm1Container.Controls.Add(SuperForm1)

    End Sub

    Sub CalendarType_Changed1(ByVal sender As Object, ByVal e As Obout.ListBox.ListBoxItemEventArgs)

        SuperForm1.DataBind()

    End Sub

    Sub CalendarType_Changed2(ByVal sender As Object, ByVal e As EventArgs)

        SuperForm1.DataBind()

    End Sub
    Sub SuperForm1_DataBound(ByVal sender As Object, ByVal e As EventArgs)

        If SuperForm1.CurrentMode = DetailsViewMode.Edit Or SuperForm1.CurrentMode = DetailsViewMode.Insert Then

            Dim orderDateCalendar As OboutInc.Calendar2.Calendar = CType(SuperForm1.Rows(4).Cells(1).Controls(0).Controls(1).Controls(0), OboutInc.Calendar2.Calendar)
            orderDateCalendar.StyleFolder = "~/Calendar/styles/" + ListBox1.SelectedValue

            Dim shippedDateCalendar As OboutInc.Calendar2.Calendar = CType(SuperForm1.Rows(5).Cells(1).Controls(0).Controls(1).Controls(0), OboutInc.Calendar2.Calendar)
            shippedDateCalendar.StyleFolder = "~/Calendar/styles/" + ListBox1.SelectedValue

            Dim requiredDateCalendar As OboutInc.Calendar2.Calendar = CType(SuperForm1.Rows(6).Cells(1).Controls(0).Controls(1).Controls(0), OboutInc.Calendar2.Calendar)
            requiredDateCalendar.StyleFolder = "~/Calendar/styles/" + ListBox1.SelectedValue

            Dim datePickerImagePath As String = "date_picker1.gif"

            If DatePicker2.Checked Then

                datePickerImagePath = "date_picker2.gif"

            ElseIf DatePicker3.Checked Then

                datePickerImagePath = "icon2.gif"
            End If

            orderDateCalendar.DatePickerImagePath = "~/Calendar/styles/" + datePickerImagePath
            shippedDateCalendar.DatePickerImagePath = "~/Calendar/styles/" + datePickerImagePath
            requiredDateCalendar.DatePickerImagePath = "~/Calendar/styles/" + datePickerImagePath
        End If
    End Sub
End Class