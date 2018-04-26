<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AssignLab.aspx.cs" Inherits="MiSAv3.Admin.AssignLab" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-2">
                <asp:Label runat="server">LabID: </asp:Label>
            </div>
            <div class="col-sm-4">
                <asp:TextBox runat="server" ID="LabIDTextBox"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-2">
                <asp:Label runat="server">University: </asp:Label>
            </div>
            <div class="col-sm-4">
                <asp:TextBox runat="server" ID="UniversityTextBox"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-2">
                <asp:Label runat="server">Course: </asp:Label>
            </div>
            <div class="col-sm-4">
                <asp:TextBox runat="server" ID="CourseTextBox"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-2">
                <asp:Label runat="server">Year: </asp:Label>
            </div>
            <div class="col-sm-4">
                <asp:TextBox runat="server" ID="YearTextBox"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-2">
                <asp:Label runat="server">CourseUnit: </asp:Label>
            </div>
            <div class="col-sm-4">
                <asp:TextBox runat="server" ID="CourseUnitTextBox"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-2">
                <asp:Button ID="AssignButton" runat="server" CssClass="btn btn-info" />
            </div>
        </div>
    </div>
</asp:Content>
