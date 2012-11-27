<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddNewExercise.ascx.cs"
    Inherits="ui_uc_AddNewExercise" %>

<style type="text/css">
    .style1
    {
        width: 421px;
        font-size: 15px;
        color: Red;
    }
</style>

<script>
    function ValidateModuleList(source, args) {
        var chkListModules = document.getElementById('<%= cblMuscleGroups.ClientID%>');
        var chkListinputs = chkListModules.getElementsByTagName("input");
        for (var i = 0; i < chkListinputs.length; i++) {
            if (chkListinputs[i].checked) {
                args.IsValid = true;
                return;
            }
        }
        args.IsValid = false;
    }</script>


<div>
    <table id="newExerciseForm">
        <tr>
            <td>
                <p>
                    Select a Muscle Group(s):</p>
            </td>
            <td>
                <asp:CheckBoxList ID="cblMuscleGroups" runat="server" RepeatDirection="Horizontal" CssClass="cblStyle">                  
                    <asp:ListItem>Chest</asp:ListItem>
                    <asp:ListItem>Back</asp:ListItem>
                    <asp:ListItem>Shoulder</asp:ListItem>
                    <asp:ListItem>Arms</asp:ListItem>
                    <asp:ListItem>Legs</asp:ListItem>
                    <asp:ListItem>Cardio</asp:ListItem>
                 </asp:CheckBoxList>
            </td>
            <td class="style1">
            <asp:CustomValidator runat="server" ID="cvmodulelist"
  ClientValidationFunction="ValidateModuleList"
  ErrorMessage="*Please select at least one muscle group" ValidationGroup="AddExercise"></asp:CustomValidator>

            </td>
        </tr>
        <tr>
            <td>
                <p>
                    Exercise Name:</p>
            </td>
            <td>
                <asp:TextBox ID="tbExerciseName" runat="server" class="tbStyle"></asp:TextBox>
                
            </td>
            <td class="style1">
            <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="*Exercise name required" ControlToValidate="tbExerciseName" 
                    Display="Dynamic" ForeColor="Red" SetFocusOnError="True" 
                    ValidationGroup="AddExercise"></asp:RequiredFieldValidator>
            </td>
        </tr>
                <tr>
            <td>
                <p>
                    Exercise Attributes: </p>
            </td>
            <td>
                <asp:CheckBoxList ID="cblAttributes" runat="server" CssClass="cblStyle" 
                    RepeatDirection="Horizontal">
                    <asp:ListItem>Rep</asp:ListItem>
                    <asp:ListItem>Weight</asp:ListItem>
                    <asp:ListItem>Distance</asp:ListItem>
                    <asp:ListItem>Time</asp:ListItem>
                    <asp:ListItem>Enabled</asp:ListItem>
                </asp:CheckBoxList>
            </td>
            <td class ="style1">
<%--            <asp:CustomValidator runat="server" ID="CustomValidator1"
  ClientValidationFunction="ValidateModuleList"
  ErrorMessage="*Please select at least one attribute" ValidationGroup="AddExercise"></asp:CustomValidator>--%>
            </td>
        </tr>
        <tr>
            <td>
                <p>
                    Equipment:</p>
            </td>
            <td>
                <asp:TextBox ID="tbEquipment" runat="server" Height="144px" CssClass="tbStyle" 
                    TextMode="MultiLine"></asp:TextBox>
<%--                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="tbEquipment" ErrorMessage="*Please enter a proper name" 
                    ValidationExpression="^[A-Za-z]{1,}$" ForeColor="Red" 
                    ValidationGroup="AddExercise"></asp:RegularExpressionValidator>--%>
            </td>
        </tr>
        <tr>
            <td>
                <p>
                    Video Link:
                </p>
            </td>
            <td>
                <asp:TextBox ID="tbVideoLink" runat="server" CssClass="tbStyle"></asp:TextBox>
            </td>
        </tr>
    </table>
    <%--OnClientClick="return confirm('Are you sure you would create this exercise');" --%>
    <asp:Button ID="btnCreateExercise" runat="server" Text="Create" 
        CssClass="button" style="margin-left: 210px; width: 300px;" 
        ValidationGroup="AddExercise" onclick="btnCreateExercise_Click" />

    <br />
    <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
    <hr />
</div>
