<%@ Page Title="" Language="C#" MasterPageFile="~/ui/mp/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="userRoutines_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h4>List of Routines</h4>
    <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource1" DataTextField="name" DataValueField="id"></asp:RadioButtonList>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="viewRoutines" TypeName="routineManager"></asp:ObjectDataSource>
    <div id="routines">
        <h4>Create New Routine</h4>
        <h4>Modify Routine</h4>
        <h4>Delete Routine</h4>
    </div>
    <div id="loggedRoutines">
        <h4>View Logged Routine Data</h4>
        <h4>Log Routine Data</h4>
        <h4>Modify Logged Routine Data</h4>
    </div>
</asp:Content>

