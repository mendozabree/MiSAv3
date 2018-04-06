<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="SetUpExperiment.aspx.cs" Inherits="MiSAv3.Admin.SetUpExperiment" %>

<asp:Content ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
  <br /><br />

    <div class="container">

        <asp:Panel ID="NewExperimemtPanel" runat="server">
        <div class="container" id="ExperimentDetails">
            <div class="row">
                <div class="col-sm-5">
                    <asp:HiddenField ID="hfExperimentID" runat="server" />
                </div>
            </div>
            <!--Title-->
            <div class="row">
                <asp:Label ID="Label8" runat="server" Text="Title"></asp:Label>
                <asp:TextBox ID="ExperimentTitle" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <!--Author-->
            <div class="row">
                <asp:Label ID="AuthorLbl" runat="server" Text="Author"></asp:Label>
                <asp:TextBox ID="Author" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <!--Help-->
            <div class="row">
                <asp:Label ID="HelpLbl" runat="server" Text="Help"></asp:Label>
                <asp:TextBox ID="Help" runat="server" CssClass="form-control"></asp:TextBox>
            </div><br />
            <!--Class-->
            <div class="row">
                <div class="col-sm-2">
                <asp:Label ID="Label2" runat="server" Text="Programme"></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="Programme" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:Label ID="Label4" runat="server" Text="Year"></asp:Label>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="Year" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                 <div class="col-sm-2">
                    <asp:Label ID="Label5" runat="server" Text="CourseUnit"></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="CourseUnit" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <!--Manual-->
            <div class="row">
                <asp:Label ID="Label1" runat="server" Text="Manual"></asp:Label>
                <asp:FileUpload ID="ExperimentManual" runat="server" />
            </div>
            <!--ExperimentFile--> 
            <div class="row">
                <asp:Label ID="Label3" runat="server" Text="Experiment Folder"></asp:Label>
                <asp:FileUpload ID="ExperimentFiles" runat="server" />
            </div>
            <!--ExperimentStatus--> 
            <asp:DropDownList ID="ExperimentStatus" runat="server">
                <asp:ListItem>Active</asp:ListItem>
                <asp:ListItem>InActive</asp:ListItem>
            </asp:DropDownList>
            <br />
            <div class="row">
                <asp:Button ID="SaveBtn" runat="server" Text="Save" OnClick="SaveBtnClick" CssClass="btn btn-success"/>
            </div>
            
        </div>

    </asp:Panel>
    </div>
</asp:Content>