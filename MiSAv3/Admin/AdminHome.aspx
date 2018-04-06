<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="MiSAv3.Admin.AdminHome" %>

<asp:Content runat="server" ContentPlaceHolderID="AdminContentPlaceHolder">
    
    <asp:Panel ID="GridView" runat="server">
        <div class="container">
            <br />
            <div class="row">
                <div class="col-sm-12">
                    <asp:GridView ID="gv" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="Title" HeaderText="Title" />
                            <asp:BoundField DataField="Programme" HeaderText="Programme" />
                            <asp:BoundField DataField="StudyYear" HeaderText="StudyYear" />
                            <asp:BoundField DataField="CourseUnit" HeaderText="CourseUnit" />
                            <asp:BoundField DataField="ExperimentStatus" HeaderText="Status" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkView" runat="server" CommandArgument='<%# Eval("ExperimentID") %>'
                                        OnClick="lnkView_Click">Edit</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </asp:Panel>

    <asp:Panel ID="ExperimentDetailsPanel" runat="server" Visible="false">
        <div class="container" id="ExperimentDetails">
            <div class="row">
                <div class="col-sm-5">
                    <asp:HiddenField ID="hfExperimentID" runat="server" />
                </div>
            </div>
            <!--Title-->
            <div class="row">
                <asp:Label ID="Label8" runat="server" Text="Title"></asp:Label>
                <asp:TextBox ID="AdminExpTitle" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <!--Author-->
            <div class="row">
                <asp:Label ID="AuthorLbl" runat="server" Text="Author"></asp:Label>
                <asp:TextBox ID="AdminAuthor" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <!--Help-->
            <div class="row">
                
                <asp:Label ID="HelpLbl" runat="server" Text="Help"></asp:Label>
                <asp:TextBox ID="AdminHelp" runat="server" CssClass="form-control"></asp:TextBox>
            </div> <br />
            <!--Class-->
            <div class="row">
                <div class="col-sm-2">
                <asp:Label ID="Label2" runat="server" Text="Programme"></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="Programme" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-2">
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
                <asp:FileUpload ID="cctImage" runat="server" CssClass="form-control"/>
            </div>
            
            <!--ExperimentFile--> 
            <div class="row">
                <asp:Label ID="Label3" runat="server" Text="Experiment Folder"></asp:Label>
                <asp:FileUpload ID="ExperimentFiles" runat="server" />
            </div>
            <br />
            <!--ExperimentStatus--> 
            <asp:DropDownList ID="ExperimentStatus" runat="server">
                <asp:ListItem Selected="True">-------</asp:ListItem>
                <asp:ListItem>Active</asp:ListItem>
                <asp:ListItem>InActive</asp:ListItem>
            </asp:DropDownList>

            <div class="row">
                <div class="col-2">
                <asp:Button ID="BtnSaveChanges" runat="server" Text="Update" OnClick="OnSaveChangesBtnClick" CssClass="btn btn-primary"/>
                </div>
                <div class="col-2">
                <asp:Button ID="DeleteButton" runat="server" Text="Delete" OnClick="DeleteButton_Click" CssClass="btn btn-danger"/>
                </div>
            </div>
        </div>

    </asp:Panel>

</asp:Content>
