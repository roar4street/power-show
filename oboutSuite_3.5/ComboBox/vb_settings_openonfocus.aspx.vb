﻿Imports Obout.ComboBox
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class ComboBox_vb_settings_openonfocus
    Inherits System.Web.UI.Page
    Dim ComboBox1 As ComboBox

   Sub Page_load(ByVal sender As Object, ByVal e As EventArgs) 
        ComboBox1 = New ComboBox()
        ComboBox1.ID = "ComboBox1"
        ComboBox1.Width = Unit.Pixel(250)
        ComboBox1.Height = Unit.Pixel(200)
        ComboBox1.EmptyText = "Select a customer ..."
        ComboBox1.OpenOnFocus = True
        ComboBox1.DataSourceID = "sds1"
        ComboBox1.DataTextField = "CompanyName"
        ComboBox1.DataValueField = "CustomerID"

        ComboBox1Container.Controls.Add(ComboBox1)

    End Sub

    Sub OboutCheckBox1_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
        ComboBox1.OpenOnFocus = OboutCheckBox1.Checked
    End Sub
End Class
