<%@ Page Title="" Language="C#" MasterPageFile="~/ui/mp/MasterPage.master" AutoEventWireup="true"
    CodeFile="modifySystemExercises.aspx.cs" Inherits="systemExercise_modifySystemExercises" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="Server">
        </asp:ScriptManager>
        <label for="_Default">
            Search to modify an exercise:
        </label>
        <asp:TextBox runat="server" ID="exerciseSearchBox" ClientIDMode="Static" AutoPostBack="False" />
        <juice:Autocomplete ID="exerciseAutoComplete" runat="server" TargetControlID="exerciseSearchBox" />
        <asp:Button ID="btnSearch" runat="server" Text="SEARCH" OnClick="btnSearch_Click" />
        <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid symbols in search field"
            ControlToValidate="exerciseSearchBox" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9 ]+$"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server">
            <div>
                <table id="newExerciseForm">
                    <tr>
                        <td>
                            <p>
                                Muscle Groups:</p>
                        </td>
                        <td>
                            <asp:CheckBoxList ID="cblMuscleGroups" runat="server" RepeatDirection="Horizontal"
                                CssClass="cblStyle">
                                <asp:ListItem>Chest</asp:ListItem>
                                <asp:ListItem>Back</asp:ListItem>
                                <asp:ListItem>Shoulder</asp:ListItem>
                                <asp:ListItem>Arms</asp:ListItem>
                                <asp:ListItem>Legs</asp:ListItem>
                                <asp:ListItem>Cardio</asp:ListItem>
                            </asp:CheckBoxList>
                        </td>
                        <td class="style1">
                            <asp:CustomValidator runat="server" ID="cvmodulelist" ClientValidationFunction="ValidateModuleList"
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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Exercise name required"
                                ControlToValidate="tbExerciseName" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"
                                ValidationGroup="AddExercise"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>
                                Exercise Attributes:
                            </p>
                        </td>
                        <td>
                            <asp:CheckBoxList ID="cblAttributes" runat="server" CssClass="cblStyle" RepeatDirection="Horizontal">
                                <asp:ListItem>Rep</asp:ListItem>
                                <asp:ListItem>Weight</asp:ListItem>
                                <asp:ListItem>Distance</asp:ListItem>
                                <asp:ListItem>Time</asp:ListItem>
                                <asp:ListItem>Enabled</asp:ListItem>
                            </asp:CheckBoxList>
                        </td>
                        <td class="style1">
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
                            <asp:TextBox ID="tbEquipment" runat="server" Height="144px" CssClass="tbStyle" TextMode="MultiLine"></asp:TextBox>
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
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="btnConfirmChanges" runat="server" 
                                onclick="btnConfirmChanges_Click" Text="CONFIRM" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="lblResult" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
    </div>
    </asp:Panel>
</asp:Content>
