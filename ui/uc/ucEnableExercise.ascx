<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucEnableExercise.ascx.cs"
    Inherits="systemExercise_ucEnableExercise" %>
<div>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="getExercises"
        TypeName="disableManager"></asp:ObjectDataSource>
    <asp:DropDownList ID="ddlExercises" runat="server" DataSourceID="ObjectDataSource2"
        DataTextField="name" DataValueField="id" AutoPostBack="True" 
        onselectedindexchanged="ddlExercises_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:RadioButtonList ID="rblEnaber" runat="server" AutoPostBack="True" 
        onselectedindexchanged="rblEnaber_SelectedIndexChanged" TextAlign="Left">
        <asp:ListItem Value="1">Enabled</asp:ListItem>
        <asp:ListItem Value="0">Disabled</asp:ListItem>
    </asp:RadioButtonList>
</div>
<br />
<div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="getExercises"
        TypeName="disableManager"></asp:ObjectDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
        <Columns>
            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
            <asp:BoundField DataField="equipment" HeaderText="equipment" SortExpression="equipment" />
            <asp:BoundField DataField="videoLink" HeaderText="videoLink" SortExpression="videoLink" />
            <asp:CheckBoxField DataField="rep" HeaderText="rep" SortExpression="rep" />
            <asp:CheckBoxField DataField="weight" HeaderText="weight" SortExpression="weight" />
            <asp:CheckBoxField DataField="distance" HeaderText="distance" SortExpression="distance" />
            <asp:CheckBoxField DataField="time" HeaderText="time" SortExpression="time" />
            <asp:CheckBoxField DataField="enabled" HeaderText="enabled" SortExpression="enabled" />
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
            <asp:BoundField DataField="muscleGroups" HeaderText="muscleGroups" SortExpression="muscleGroups" />
        </Columns>
    </asp:GridView>
</div>
