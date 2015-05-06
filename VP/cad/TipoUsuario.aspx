<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TipoUsuario.aspx.cs" Inherits="VP.cad.TipoUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<div id="coluna1">
<h2>Tabela de Tipo de Usuário</h2>
<asp:ImageButton ID="ImageButtonNovo1" runat="server" ImageUrl="~/Images/insert.png" OnClick="ImageButtonNovo1_Click" Width="20px" />
<asp:GridView ID="GridViewTipoUsuario" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" PageSize=30
	CellPadding="4" ForeColor="#333333" GridLines="None" 
	DataKeyNames="Codigo" DataSourceID="SqlDataSourceTipoUsuario" EmptyDataText="Tabela sem registros."
	OnRowEditing="GridViewTipoUsuario_RowEditing" OnRowUpdated="GridViewTipoUsuario_RowUpdated" OnRowCancelingEdit="GridViewTipoUsuario_RowCancelingEdit" 
	OnSelectedIndexChanged="GridViewTipoUsuario_SelectedIndexChanged" 
	OnRowDeleted="GridViewTipoUsuario_RowDeleted" 
	>
	<Columns>
		<asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" InsertVisible="False"  ReadOnly="True" />
		<asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/update.png" SelectText="Atualizar" ShowSelectButton="True" ControlStyle-Width="20px" >
				<ControlStyle Width="20px"></ControlStyle>
			</asp:CommandField>
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/delete.png" DeleteText="Apagar" ShowDeleteButton="True" ControlStyle-Width="20" >
				<ControlStyle Width="20px"></ControlStyle>
            </asp:CommandField>
    </Columns>
        <EditRowStyle BackColor="#7C6F57" />        <RowStyle BackColor="#E3EAEB" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />        <SortedDescendingHeaderStyle BackColor="#15524A" />
</asp:GridView>
	<asp:SqlDataSource ID="SqlDataSourceTipoUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
		DeleteCommand="TipoUsuarioD" DeleteCommandType="StoredProcedure"
		InsertCommand="TipoUsuarioIU" InsertCommandType="StoredProcedure"
		UpdateCommand="TipoUsuarioIU" UpdateCommandType="StoredProcedure"
		SelectCommand="TipoUsuarioS" SelectCommandType="StoredProcedure" >
		<SelectParameters>
		</SelectParameters>
		<DeleteParameters>
			<asp:Parameter Name="Codigo" Type="Int32" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="Codigo" Type="Int32" />
			<asp:Parameter Name="Descricao" Type="String" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="Codigo" Type="Int32" />
			<asp:Parameter Name="Descricao" Type="String" />
		</UpdateParameters>
	</asp:SqlDataSource>
</div>
<div = id="coluna2">
<asp:ImageButton ID="ImageButtonNovo2" runat="server" ImageUrl="~/Images/insert.png" OnClick="ImageButtonNovo2_Click" Width="20px" />
<asp:DetailsView ID="DetailsViewTipoUsuario" runat="server" AllowPaging="True" AutoGenerateRows="False"
	DataKeyNames="Codigo" DataSourceID="SqlDataSourceTipoUsuarioDV" 
	OnItemDeleted="DetailsViewTipoUsuario_ItemDeleted" OnItemInserted="DetailsViewTipoUsuario_ItemInserted" OnItemUpdated="DetailsViewTipoUsuario_ItemUpdated" 
	OnItemInserting="DetailsViewTipoUsuario_ItemInserting"
	CellPadding="4" ForeColor="#333333" GridLines="None" 
	>
	<Fields>
		<asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" InsertVisible="False"  ReadOnly="True" />
		<asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
            <asp:CommandField DeleteText="Apagar" ShowDeleteButton="True" 
				ShowEditButton="True" EditText="Editar" 
				ShowInsertButton="True" InsertText="Inserir" />
    </Fields>

            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
            <EditRowStyle BackColor="#7C6F57" />
            <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
</asp:DetailsView>
	<asp:SqlDataSource ID="SqlDataSourceTipoUsuarioDV" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
		DeleteCommand="TipoUsuarioD" DeleteCommandType="StoredProcedure"
		InsertCommand="TipoUsuarioIU" InsertCommandType="StoredProcedure"
		UpdateCommand="TipoUsuarioIU" UpdateCommandType="StoredProcedure"
		SelectCommand="View_TipoUsuarioS" SelectCommandType="StoredProcedure">
		<SelectParameters>
			<asp:ControlParameter ControlID="GridViewTipoUsuario" Name="Codigo" PropertyName="SelectedValue" Type="Int32" />
		</SelectParameters>
		<DeleteParameters>
			<asp:Parameter Name="Codigo" Type="Int32" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="Codigo" Type="Int32" />
			<asp:Parameter Name="Descricao" Type="String" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="Codigo" Type="Int32" />
			<asp:Parameter Name="Descricao" Type="String" />
		</UpdateParameters>
	</asp:SqlDataSource>
</div>

</asp:Content>
