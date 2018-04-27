<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="MiSAv3.Admin.AdminHome" %>

<asp:Content runat="server" ContentPlaceHolderID="AdminContentPlaceHolder">

    <asp:Panel ID="ExperimentsGridView" runat="server">
        <div class="container">
            <br />
            <div class="row">
                <div class="col-sm-12">
                    <asp:GridView ID="gv" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="ExperimentID" HeaderText="ExpId" />
                            <asp:BoundField DataField="ExperimentTitle" HeaderText="Title" />
                            <asp:BoundField DataField="ExperimentStatus" HeaderText="Status" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkView" runat="server" CommandArgument='<%# Eval("ExperimentID") %>'
                                        OnClick="lnkView_Click">Edit</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="Assignlnk" runat="server" CommandArgument='<%# Eval("ExperimentID") %>'
                                        OnClick="DeleteExperiment_Click">Delete</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="offset-2 col-sm-2">
                    <asp:Button ID="NewExperiment" runat="server" Text="Set Up Experiment" OnClick="NewExperiment_Click" CssClass="btn btn-block btn-info" />
                </div>
            </div>
        </div>
    </asp:Panel>

    <asp:Panel ID="ExperimemtDetailsPanel" runat="server" Visible="false">
        <div class="container" id="ExperimentDetails">
            <div class="row form-group">
                <div class="col-sm-5">
                    <asp:HiddenField ID="hfExperimentID" runat="server" />
                </div>
            </div>
            <!--Title-->
            <div class="row form-group">
                <div class="offset-2 col-sm-2">
                    <asp:Label AssociatedControlID="ExperimentTitleTextBox" runat="server" Text="Title" />
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="ExperimentTitleTextBox" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ExperimentTitleTextBox"
                        CssClass="text-danger" ErrorMessage="ExperimentTitle is required." />
                </div>
            </div>
            <!--Manual-->
            <div class="row form-group">
                <div class="offset-2 col-sm-2">
                    <asp:Label AssociatedControlID="ManualTextBox" runat="server" Text="Lab Manual" />
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="ManualTextBox" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ManualTextBox"
                        CssClass="text-danger" ErrorMessage="Manual is required." />

                </div>
            </div>
            <!--ContactEmail-->
            <div class="row form-group">
                <div class="offset-2 col-sm-2">
                    <asp:Label AssociatedControlID="ContactEmailTextBox" runat="server" Text="Contact Email" />
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="ContactEmailTextBox" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ContactEmailTextBox"
                        CssClass="text-danger" ErrorMessage="ContactEmail is required." />
                </div>
            </div>
            <!--Lab Link-->
            <div class="row form-group">
                <div class=" offset-2 col-sm-2">
                    <asp:Label AssocaitedControlID="LabLinkTextBox" runat="server" Text="Lab Link"></asp:Label>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="LabLinkTextBox" runat="server" CssClass="form-control TextBox" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="LabLinkTextBox"
                        CssClass="text-danger" ErrorMessage="Lab Link is required." />
                </div>
            </div>
            <!--ExperimentStatus-->
            <div class="row form-group">
                <div class="offset-2 col-sm-2">
                    <asp:Label AssociatedControlID="ExperimentStatus" runat="server" Text="Status" />
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList ID="ExperimentStatus" runat="server" CssClass="form-control">
                        <asp:ListItem>-------</asp:ListItem>
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>InActive</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ExperimentStatus"
                        CssClass="text-danger" ErrorMessage="Experiment Status is required." />
                </div>
            </div>
            <div class="row">
                <div class="offset-3 col-sm-2">
                    <asp:Button ID="SaveBtn" runat="server" Text="Save" OnClick="OnSaveChangesBtnClick" CssClass="btn btn-success btn-block" />
                </div>
                <div class="col-sm-2">
                    <asp:Button ID="DeleteBtn" runat="server" Text="Delete" OnClick="DeleteExperiment_Click" CssClass="btn btn-danger btn-block" />
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
