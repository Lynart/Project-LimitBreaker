<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="getAllExercises" TypeName="Layer2Manager"></asp:ObjectDataSource>
        <asp:DropDownList ID="ddlExercises" runat="server" 
            onselectedindexchanged="ddlExercises_SelectedIndexChanged" 
            DataSourceID="ObjectDataSource1" DataTextField="name" DataValueField="id">
        </asp:DropDownList>
    </div>
    <h3>Neil's search motorbikes</h3>
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <label for="_Default">
            SEARCH EXERCISE:
        </label>
        <asp:TextBox runat="server" ID="autocomplete" ClientIDMode="Static" />
        <juice:Autocomplete ID="Autocomplete1" runat="server" TargetControlID="autocomplete"
            Source="ActionScript, AppleScript, Asp, BASIC, C, C++, Clojure, COBOL, ColdFusion, Erlang, Fortran, Groovy, Haskell, Java, JavaScript, Lisp, Perl, PHP, Python, Ruby, Scala, Scheme" />
    </div>
    </form>
</body>
</html>
