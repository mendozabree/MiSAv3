<%@ Page Title="New" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Old.aspx.cs" Inherits="MiSAv3.Client.New" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <link href="../Content/main.css" rel="stylesheet" />

    <div class="dialog">
        <table border="0">
            <tr>
                <td></td>
                <td>
                    <div class="header">New Event</div>
                </td>
            </tr>
            <tr>
                <td>Name:</td>
                <td>
                    <asp:Label ID="Name" runat="server"><%: Context.User.Identity.GetUserName()  %></asp:Label></td>
            </tr>
            <tr>
                <td>Start:</td>
                <td>
                    <asp:TextBox ID="TextBoxStart" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>End:</td>
                <td>
                    <asp:TextBox ID="TextBoxEnd" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label runat="server" Text="expID" /></td>
                <td>
                    <asp:TextBox ID="ExperimentID" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="ButtonOK" runat="server" OnClick="ButtonOK_Click" Text="OK" />
                    <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" OnClick="ButtonCancel_Click" />
                </td>
            </tr>
        </table>

    </div>

</asp:Content>
