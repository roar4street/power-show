<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script language="VB" runat="server">
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        CreateButton(Unit.Percentage(100), PlaceHolder1)
        CreateButton(Unit.Percentage(50), PlaceHolder2)
        CreateButton(Unit.Percentage(25), PlaceHolder3)
        CreateButton(Unit.Pixel(200), PlaceHolder4)
        CreateButton(Unit.Pixel(0), PlaceHolder5)
        
        CreateDropDownList(Unit.Percentage(100), cont1)
        CreateDropDownList(Unit.Percentage(50), cont2)
        CreateDropDownList(Unit.Percentage(25), cont3)
        CreateDropDownList(Unit.Pixel(200), cont4)
        CreateDropDownList(Unit.Pixel(0), cont5)

        CreateTextBox(Unit.Percentage(100), cont6)
        CreateTextBox(Unit.Percentage(50), cont7)
        CreateTextBox(Unit.Percentage(25), cont8)
        CreateTextBox(Unit.Pixel(200), cont9)
        CreateTextBox(Unit.Pixel(0), cont10)
    End Sub
    
    Sub CreateButton(ByVal width As Unit, ByVal container As Control)
        Dim btn As OboutButton = New OboutButton()
        If width <> Unit.Pixel(0) Then
            btn.Width = width
        End If
        btn.Text = "Click Me!"

        container.Controls.Add(btn)
    End Sub

    Sub CreateDropDownList(ByVal width As Unit, ByVal container As Control)
        Dim ddl As OboutDropDownList = New OboutDropDownList()
        If width <> Unit.Pixel(0) Then        
            ddl.Width = width
        End If        

        ddl.Items.Add(New ListItem("Item 1"))
        ddl.Items.Add(New ListItem("Item 2"))
        ddl.Items.Add(New ListItem("Item 3"))
        ddl.Items.Add(New ListItem("Item 4"))
        ddl.Items.Add(New ListItem("Item 5"))
        ddl.Items.Add(New ListItem("Item 6"))
        ddl.Items.Add(New ListItem("Item 7"))
        ddl.Items.Add(New ListItem("Item 8"))
        ddl.Items.Add(New ListItem("Item 9"))

        container.Controls.Add(ddl)
    End Sub

    Sub CreateTextBox(ByVal width As Unit, ByVal container As Control)
        Dim txt As OboutTextBox = New OboutTextBox()
        If width <> Unit.Pixel(0) Then
            txt.Width = width
        End If

        container.Controls.Add(txt)
    End Sub
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

<html>
	<head>
		<title>obout Interface examples</title>
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
			.option2{
				font:11px Verdana;
				color:#0033cc;				
				padding-left:4px;
				padding-right:4px;
			}
			a {
				font:11px Verdana;
				color:#315686;
				text-decoration:underline;
			}

			a:hover {
				color:crimson;
			}
		</style>		
	</head>
	<body style="margin: 0px;">
		<form id="Form1" runat="server">
		
		<br /><br />				
		
		<span class="tdText"><b>obout Interface - Width property</b></span>
		
		<br /><br />
		
		<span class="tdText">Width="100%"</span><br />
		<asp:PlaceHolder runat="server" ID="PlaceHolder1" />		
		
		<br /><br />
		
		<span class="tdText">Width="50%"</span><br />
		<asp:PlaceHolder runat="server" ID="PlaceHolder2" />
		
		<br /><br />
		
		<span class="tdText">Width="25%"</span><br />
		<asp:PlaceHolder runat="server" ID="PlaceHolder3" />
		
		<br /><br />
		
		<span class="tdText">Width="200"</span><br />
		<asp:PlaceHolder runat="server" ID="PlaceHolder4" />
		
		<br /><br />
		
		<span class="tdText">auto width</span><br />
		<asp:PlaceHolder runat="server" ID="PlaceHolder5" />
		
		<br /><br />
		
		<span class="tdText">Width="100%"</span><br />
		<asp:PlaceHolder runat="server" ID="cont1" />		
		
		<br /><br />
		
		<span class="tdText">Width="50%"</span><br />
		<asp:PlaceHolder runat="server" ID="cont2" />
		
		<br /><br />
		
		<span class="tdText">Width="25%"</span><br />
		<asp:PlaceHolder runat="server" ID="cont3" />
		
		<br /><br />
		
		<span class="tdText">Width="200"</span><br />
		<asp:PlaceHolder runat="server" ID="cont4" />
		
		<br /><br />
		
		<span class="tdText">auto width</span><br />
		<asp:PlaceHolder runat="server" ID="cont5" />
		
		<br /><br />
		
		<span class="tdText">Width="100%"</span><br />
		<asp:PlaceHolder runat="server" ID="cont6" />
		
		<br /><br />
		
		<span class="tdText">Width="50%"</span><br />
		<asp:PlaceHolder runat="server" ID="cont7" />
		
		<br /><br />
		
		<span class="tdText">Width="25%"</span><br />
		<asp:PlaceHolder runat="server" ID="cont8" />
		
		<br /><br />
		
		<span class="tdText">Width="200"</span><br />
		<asp:PlaceHolder runat="server" ID="cont9" />
		
		<br /><br />
		
		<span class="tdText">auto width</span><br />
		<asp:PlaceHolder runat="server" ID="cont10" />
		
		<br /><br /><br />
		
		<span class="tdText">
		    The <b>Width</b> property may be set either by using fixed values (pixels) or by using a relative value (percentages).<br />
		    If the <b>Width</b> is not specified the controls will have the same width as their container.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">� Back to examples</a>		
		
		</form>    
	</body>
</html>