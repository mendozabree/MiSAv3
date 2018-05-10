<%@ Page Title="My Labs" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyLabs.aspx.cs" Inherits="MiSAv3.Client.MyLabs" %>

<asp:Content Runat="server" ContentPlaceHolderID="MainContent">
<asp:Panel ID="ViewExperimentsPanel" runat="server">
    <div class="container">
        <br />
        <asp:Panel ID="LabsFilterPanel" runat="server">
            <div class="row form-group">
                <div class="col-sm-2">
                    <asp:Label runat="server" AssociatedControlID="Insititution" Text="University" CssClass="control-label"/>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="Insititution" runat="server" CssClass="form-control"/>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Insititution"
                        CssClass="text-danger" ErrorMessage="Insititution is required." />
                </div>
            </div>
            <div class="row form-group">
                <div class="col-sm-2">
                    <asp:Label runat="server" AssociatedControlID="Programme" Text="Course" CssClass="control-label"/>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="Programme" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Programme"
                        CssClass="text-danger" ErrorMessage="Programme is required." />
                </div>
            </div>
            <div class="row form-group">
                <div class="col-sm-2">
                    <asp:Label runat="server" AssociatedControlID="YearOfStudy" Text="Year" CssClass="control-label"/>
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList ID="YearOfStudy" runat="server" CssClass="form-control" >
                        <asp:ListItem>Select Year</asp:ListItem>
                        <asp:ListItem Value="1" />
                        <asp:ListItem Value="2" />
                        <asp:ListItem Value="3" />
                        <asp:ListItem Value="4" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="YearOfStudy"
                        CssClass="text-danger" ErrorMessage="Year is required." />
                </div>
            </div>
            <div class="row form-group">
                <div class="col-sm-2">
                    <asp:Label runat="server" AssociatedControlID="CourseUnitCode" Text="CourseUnit" CssClass="control-label"/>
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="CourseUnitCode" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="CourseUnitCode"
                        CssClass="text-danger" ErrorMessage="CourseUnit is required." />
                </div>
            </div>
            <div class="row form-group">
                <div class="offset-2 col-sm-2">
                    <asp:Button ID="ViewLabsButton" runat="server" CssClass="btn btn-primary btn-block" OnClick="ViewLabsButton_Click" Text="View Labs" />
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="AvailableLabsPanel" runat="server" Visible="false">
            <div class="row">
                <div class="col-12">
                    <asp:GridView ID="Experimentsgv" runat="server" CssClass="table table-striped table-bordered table-responsive" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="ExperimentTitle" HeaderText="Title" />
                            <asp:BoundField DataField="ExperimentID" HeaderText="Experiment ID" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="Reservelink" runat="server" CommandArgument='<%# Eval("ExperimentID") %>'
                                        OnClick="Reservelink_Click">Reserve</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div class="row">
                <div class="off-set-4">
                    <asp:Label ID="CurrentExperiment" runat="server" Visible="false"/>
                </div>
                <div class="col-sm-2">
                    <asp:Button ID="LaunchLab" runat="server" CssClass="btn btn-default btn-block" />
                </div>
            </div>
        </asp:Panel>
        <div>
            <asp:Label ID="startTime" runat="server" Visible="false"/>
        </div>
    </div>
</asp:Panel>

    
</asp:Content>