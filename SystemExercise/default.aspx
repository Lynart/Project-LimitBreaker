<%@ Page Title="" Language="C#" MasterPageFile="~/ui/mp/MasterPage.master" AutoEventWireup="true"
    CodeFile="default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/ui/uc/AddNewExercise.ascx" TagName="addExercise" TagPrefix="uc1" %>
<%@ Register Src="~/ui/uc/ucViewExercise.ascx" TagName="viewExercise" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 20px;
        }
    </style>
    <script type="text/javascript">
        function validateMuscles(source, args) {
            var chkListModules = document.getElementById('<%= cblMuscleGroups.ClientID%>');
            var chkListinputs = chkListModules.getElementsByTagName("input");
            for (var i = 0; i < chkListinputs.length; i++) {
                if (chkListinputs[i].checked) {
                    args.IsValid = true;
                    return;
                }
            }
            args.IsValid = false;
        }

        function validateAttributes(source, args) {
            var chkListModules = document.getElementById('<%= cblAttributes.ClientID%>');
            var chkListinputs = chkListModules.getElementsByTagName("input");
            for (var i = 0; i < chkListinputs.length; i++) {
                if (chkListinputs[i].checked) {
                    args.IsValid = true;
                    return;
                }
            }
            args.IsValid = false;
        }
    
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="ButtonChoiceScheduling">
        <asp:Button ID="btnAddExercise" runat="server" Text="Add Exercise" CssClass="button"
            OnClick="btnAddExercise_Click" />
        <asp:Button ID="btnModifyExercise" runat="server" Text="Modify Exercise" CssClass="button"
            OnClick="btnModifyExercise_Click" a />
    </div>
    <div class="exerciseForm">
        <%--                <asp:MultiView ID="MultiViewExercises" runat="server">
                    <asp:View ID="viewAddExercise" runat="server">--%>
        <asp:Panel ID="pnlAddExercise" runat="server">
            <h2 style="text-align:center;">
                Add system exercises</h2>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <uc1:addExercise ID="addExercises" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
        <%--                    </asp:View>
                    <asp:View ID="viewModifyExercise" runat="server">--%>
        <asp:Panel ID="pnlModifyExercises" runat="server">
            <h2 style="text-align:center;">
                Modify Exercise</h2>
            <uc1:viewExercise ID="viewExercises" runat="server" />
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:Panel ID="pnlModifyExercise" runat="server">
                        <div>
                            <table id="newExerciseForm">
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblEnabled" runat="server" Text="" Visible=false></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 19%;">
                                        <p>
                                            Muscle Groups:</p>
                                    </td>
                                    <td style="width: 60%;">
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
                                        <asp:CustomValidator runat="server" ID="cvmodulelist" ClientValidationFunction="validateMuscles"
                                            ErrorMessage="*Please select at least one muscle group" ValidationGroup="ModifyExercise"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 14%;">
                                        <p>
                                            Name:</p>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbExerciseName" runat="server" class="tbStyle" OnTextChanged="tbExerciseName_TextChanged"></asp:TextBox>
                                    </td>
                                    <td class="style1">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Exercise name required"
                                            ControlToValidate="tbExerciseName" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"
                                            ValidationGroup="ModifyExercise"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="tbExerciseName"
                                            ErrorMessage="*Please enter alphanumeric characters for name" ValidationExpression="^[-0-9a-zA-Z ]+$"
                                            ForeColor="Red" ValidationGroup="ModifyExercise"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>
                                            Attributes:
                                        </p>
                                    </td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:CheckBoxList ID="cblAttributes" runat="server" CssClass="cblStyle" RepeatDirection="Horizontal">
                                                        <asp:ListItem>Rep</asp:ListItem>
                                                        <asp:ListItem>Weight</asp:ListItem>
                                                        <asp:ListItem>Distance</asp:ListItem>
                                                        <asp:ListItem>Time</asp:ListItem>
                                                    </asp:CheckBoxList>
                                                </td>
                                                <td>
                                                    
                                                    <asp:CheckBox ID="cbEnabler" runat="server" OnCheckedChanged="rblEnaber_SelectedIndexChanged"
                                                        AutoPostBack="True" />Enabled
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="style1">
                                        <asp:CustomValidator runat="server" ID="CustomValidator1" ClientValidationFunction="validateAttributes"
                                            ErrorMessage="*Please select at least one attribute" ValidationGroup="ModifyExercise"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top;">
                                        <p>
                                            Equipment:</p>
                                    </td>
                                    <td class="style1">
                                        <asp:TextBox ID="tbEquipment" runat="server" Height="144px" CssClass="tbStyle" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                    <td class="style1" style="vertical-align: top;">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbEquipment"
                                            ErrorMessage="*Please enter equipment needed" ForeColor="Red" ValidationGroup="ModifyExercise"
                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top;">
                                        <p>
                                            Description:</p>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbModifyDescription" runat="server" Height="144px" CssClass="tbStyle"
                                            TextMode="MultiLine"></asp:TextBox>
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
                                    <td class="style1">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbVideoLink"
                                            ErrorMessage="*Please enter a video link" ForeColor="Red" ValidationGroup="ModifyExercise"
                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*Improper video link format"
                                            ControlToValidate="tbVideoLink" Display="Dynamic" ForeColor="Red" ValidationGroup="ModifyExercise"
                                            ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:Button ID="btnDeleteExercise" runat="server" Text="Delete Exercise" OnClientClick="return confirm('Doing this will irreversibly remove the exercise from the system. Are you sure?');"
                                            OnClick="btnDeleteExercise_Click" ValidationGroup="ModifyExercise" CssClass="button"
                                            Style="width: 200px;" />
                                        <asp:Button ID="btnConfirmChanges" runat="server" OnClick="btnConfirmChanges_Click"
                                            Text="Confirm Modification" ValidationGroup="ModifyExercise" CssClass="button"
                                            Style="width: 200px;" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:Label ID="lblResult" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <asp:Label ID="lblDeletionResult" runat="server"></asp:Label>
                        </div>
                    </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
        <%--                    </asp:View>
                </asp:MultiView>--%>
    </div>
</asp:Content>
