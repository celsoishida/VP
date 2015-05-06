<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="All.aspx.cs" Inherits="VP.tab.TAll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

<table><tr valign = "top"><td>
Codigo<asp:TextBox ID="TextBoxCodigo" runat="server" Width="50px"></asp:TextBox><br />
<asp:Button ID="ButtonPesquisar" runat="server" Text="Pesquisar" onclick="ButtonPesquisar_Click" /><br />
Descricao<asp:TextBox ID="TextBoxDescricao" runat="server" Width="200px"></asp:TextBox><br />
    <asp:Button ID="ButtonSalvar" runat="server" onclick="ButtonSalvar_Click" 
        Text="Salvar" />
&nbsp;&nbsp;<asp:Button ID="ButtonLimpar" runat="server" onclick="ButtonLimpar_Click" Text="Limpar" />
&nbsp;&nbsp;<asp:Button ID="ButtonExcluir" runat="server" onclick="ButtonExcluir_Click" 
                    Text="Excluir" />&nbsp;&nbsp;
<asp:Label ID="LabelMensagem" runat="server"></asp:Label>
<br />

<asp:GridView ID="GridViewTipoEstabelecimento" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" 
    DataKeyNames="Codigo" DataSourceID="SqlDataSourceTipoEstabelecimento"
        Width="653px">
    <Columns>
	<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
<asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
<asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSourceTipoEstabelecimento" runat="server" 
    ConflictDetection="CompareAllValues" 
    ConnectionString="<%$ ConnectionStrings:empregoConnectionString %>" 
    DeleteCommand="DELETE FROM TipoEstabelecimento WHERE 
Codigo = @original_Codigo" 
	InsertCommand="INSERT INTO TipoEstabelecimento (Codigo, Descricao) VALUES (
@Codigo, @Descricao)" 
    OldValuesParameterFormatString="original_{0}" 
	SelectCommand="SELECT * FROM View_TipoEstabelecimento
"
    UpdateCommand="UPDATE TipoEstabelecimento SET Descricao = @Descricao WHERE 
Codigo = @original_Codigo">
    <DeleteParameters>
        <asp:Parameter Name="Codigo" Type="Int32 " />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Codigo" Type="Int32 " />
        <asp:Parameter Name="Descricao" Type="String " />
    </InsertParameters>

    <UpdateParameters>
        <asp:Parameter Name="original_Codigo" Type="Int32 " />
        <asp:Parameter Name="Descricao" Type="String " />
    </UpdateParameters>
	</asp:SqlDataSource>
</td><td>
    <asp:TextBox ID="TextBoxTabela" runat="server"></asp:TextBox>

    <asp:TextBox ID="TextBoxVarios" runat="server" Height="447px" 
        TextMode="MultiLine" Width="596px"></asp:TextBox>
    <br />
        <asp:CheckBox ID="CheckBoxApagar" runat="server" Text="Apagar Anteriores" />
&nbsp;
    <asp:Button ID="ButtonSalvarVarios" runat="server" 
        onclick="ButtonSalvarVarios_Click" Text="Salvar" />
</td></tr></table>

</asp:Content>
