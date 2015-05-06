<%@ Page Language="C#" AutoEventWireup="true" CodeFile="01dropDown.aspx.cs" Inherits="exe_01dropDown" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="formExeDropDown" runat="server">
    <div>
    
        Cidade:
        <asp:DropDownList ID="DropDownListCidade" runat="server" Width="310px" DataSourceID="SqlDataSourcePais" DataTextField="Descricao" DataValueField="Codigo">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourcePais" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" SelectCommand="PaisS2" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:Button ID="ButtonSelecao" runat="server" OnClick="ButtonSelecao_Click" Text="Seleção" style="height: 29px" />
        <br />
        <br />
        Codigo: <asp:TextBox ID="TextBoxCodigo" runat="server"></asp:TextBox>
        <br />
        Descrição:
        <asp:TextBox ID="TextBoxDescricao" runat="server" Width="306px"></asp:TextBox>
    
    </div>
    </form>
</body>
</html>
