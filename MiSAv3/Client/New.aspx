<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="New.aspx.cs" Inherits="MiSAv3.Client.New" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New event</title>
    <link href="../Content/main.css" rel="stylesheet" />
</head>
<body class="dialog">
    <form id="form1" runat="server">
    <div>
        <table border="0" >
            <tr>
                <td ></td>
                <td>
                    <div class="header">New Event</div>
                </td>
            </tr>
            <tr>
                <td >Start:</td>
                <td><asp:TextBox ID="TextBoxStart" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td >End:</td>
                <td><asp:TextBox ID="TextBoxEnd" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td >Name:</td>
                <td><asp:Label ID="Name" runat="server" ><%: Context.User.Identity.GetUserName()  %></asp:Label></td>
            </tr>
            <tr>
                <td ></td>
                <td>
                    <asp:Button ID="ButtonOK" runat="server" OnClick="ButtonOK_Click" Text="OK" />
                    <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" OnClick="ButtonCancel_Click" />
                </td>
            </tr>
        </table>
        
        </div>
    </form>
</body>
</html>
