<%@ Page Language="C#" AutoEventWireup="true" CodeFile="10ExeSP.aspx.cs" Inherits="ExeSP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
Codigo<asp:TextBox ID="TextBoxCodigo" runat="server" Width="50px"></asp:TextBox><br />
<asp:Button ID="ButtonPesquisar" runat="server" Text="Pesquisar" onclick="ButtonPesquisar_Click" /><br />
Descricao<asp:TextBox ID="TextBoxDescricao" runat="server" Width="200px"></asp:TextBox><br />
Sigla<asp:TextBox ID="TextBoxSigla" runat="server" Width="200px"></asp:TextBox><br />
    <asp:Button ID="ButtonSalvar" runat="server" onclick="ButtonSalvar_Click" 
        Text="Salvar" />
&nbsp;&nbsp;<asp:Button ID="ButtonLimpar" runat="server" onclick="ButtonLimpar_Click" Text="Limpar" />
&nbsp;&nbsp;<asp:Button ID="ButtonExcluir" runat="server" onclick="ButtonExcluir_Click" 
                    Text="Excluir" />&nbsp;&nbsp;
<asp:Label ID="LabelMensagem" runat="server"></asp:Label>
<br />
<asp:GridView ID="GridViewUniversidade" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" 
    DataKeyNames="Codigo" DataSourceID="SqlDataSourceUniversidade"
        Width="653px">
    <Columns>
	<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
<asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
<asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
<asp:BoundField DataField="Sigla" HeaderText="Sigla" SortExpression="Sigla" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSourceUniversidade" runat="server" 
    ConflictDetection="CompareAllValues" 
    ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
    DeleteCommand="DELETE FROM Universidade WHERE 
Codigo = @original_Codigo" 
	InsertCommand="INSERT INTO Universidade (Codigo, Descricao, Sigla) VALUES (
@Codigo, @Descricao, @Sigla)" 
    OldValuesParameterFormatString="original_{0}" 
	SelectCommand="SELECT * FROM View_Universidade
"
    UpdateCommand="UPDATE Universidade SET Descricao = @Descricao, Sigla = @Sigla WHERE 
Codigo = @original_Codigo">
    <DeleteParameters>
        <asp:Parameter Name="Codigo" Type="Int32 " />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Codigo" Type="Int32 " />
        <asp:Parameter Name="Descricao" Type="String " />
        <asp:Parameter Name="Sigla" Type="String " />
    </InsertParameters>

    <UpdateParameters>
        <asp:Parameter Name="original_Codigo" Type="Int32 " />
        <asp:Parameter Name="Descricao" Type="String " />
        <asp:Parameter Name="Sigla" Type="String " />
    </UpdateParameters>
	</asp:SqlDataSource>

    
    </div>
    </form>
</body>
</html>
