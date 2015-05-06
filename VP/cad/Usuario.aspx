<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="VP.cad.Usuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

<div id="coluna1">
<h2>Tabela de Usuario</h2>
<asp:ImageButton ID="ImageButtonNovo1" runat="server" ImageUrl="~/Images/insert.png" OnClick="ImageButtonNovo1_Click" Width="20px" />
<asp:GridView ID="GridViewUsuario" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" PageSize=30
	CellPadding="4" ForeColor="#333333" GridLines="None" 
	DataKeyNames="Codigo" DataSourceID="SqlDataSourceUsuario" EmptyDataText="Tabela sem registros."
	OnRowEditing="GridViewUsuario_RowEditing" OnRowUpdated="GridViewUsuario_RowUpdated" OnRowCancelingEdit="GridViewUsuario_RowCancelingEdit" 
	OnSelectedIndexChanged="GridViewUsuario_SelectedIndexChanged" 
	OnRowDeleted="GridViewUsuario_RowDeleted" 
	>
	<Columns>
		<asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" ReadOnly="True" />
		<asp:BoundField DataField="CPF" HeaderText="CPF" SortExpression="CPF" />
		<asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
		<asp:BoundField DataField="Login" HeaderText="Login" SortExpression="Login" />
		<asp:BoundField DataField="Senha" HeaderText="Senha" SortExpression="Senha" Visible="False" />
		<asp:BoundField DataField="email" HeaderText="email" SortExpression="email" Visible="False" />
		<asp:BoundField DataField="TipoUsuario" HeaderText="TipoUsuario" SortExpression="TipoUsuario" ReadOnly="True" Visible="False" />
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
	<asp:SqlDataSource ID="SqlDataSourceUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
		DeleteCommand="UsuarioD" DeleteCommandType="StoredProcedure"
		InsertCommand="UsuarioIU" InsertCommandType="StoredProcedure"
		UpdateCommand="UsuarioIU" UpdateCommandType="StoredProcedure"
		SelectCommand="UsuarioS" SelectCommandType="StoredProcedure" >
		<SelectParameters>
		</SelectParameters>
		<DeleteParameters>
			<asp:Parameter Name="Codigo" Type="Int32" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="Codigo" Type="Int32" />
			<asp:Parameter Name="CPF" Type="Double" />
			<asp:Parameter Name="Nome" Type="String" />
			<asp:Parameter Name="Login" Type="String" />
			<asp:Parameter Name="Senha" Type="String" />
			<asp:Parameter Name="email" Type="String" />
			<asp:Parameter Name="TipoUsuario" Type="Int32" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="Codigo" Type="Int32" />
			<asp:Parameter Name="CPF" Type="Double" />
			<asp:Parameter Name="Nome" Type="String" />
			<asp:Parameter Name="Login" Type="String" />
			<asp:Parameter Name="Senha" Type="String" />
			<asp:Parameter Name="email" Type="String" />
			<asp:Parameter Name="TipoUsuario" Type="Int32" />
		</UpdateParameters>
	</asp:SqlDataSource>
</div>
<div = id="coluna2">
<asp:ImageButton ID="ImageButtonNovo2" runat="server" ImageUrl="~/Images/insert.png" OnClick="ImageButtonNovo2_Click" Width="20px" />
<asp:DetailsView ID="DetailsViewUsuario" runat="server" AllowPaging="True" AutoGenerateRows="False"
	DataKeyNames="Codigo" DataSourceID="SqlDataSourceUsuarioDV" 
	OnItemDeleted="DetailsViewUsuario_ItemDeleted" OnItemInserted="DetailsViewUsuario_ItemInserted" OnItemUpdated="DetailsViewUsuario_ItemUpdated" 
	OnItemInserting="DetailsViewUsuario_ItemInserting"
	CellPadding="4" ForeColor="#333333" GridLines="None" 
	>
	<Fields>
		<asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" ReadOnly="True" />
		<asp:BoundField DataField="CPF" HeaderText="CPF" SortExpression="CPF" />
		<asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
		<asp:BoundField DataField="Login" HeaderText="Login" SortExpression="Login" />
		<asp:BoundField DataField="Senha" HeaderText="Senha" SortExpression="Senha" />
		<asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
		<asp:TemplateField HeaderText="TipoUsuario" SortExpression="TipoUsuario">
            <ItemTemplate>
                <asp:Label ID="Label5" runat="server" Text='<%# Bind("DesTipoUsuario") %>'></asp:Label>
            </ItemTemplate>
            <InsertItemTemplate>
                <asp:DropDownList ID="DropDownListTipoUsuario2" runat="server" DataSourceID="SqlDataSourceDDTipoUsuario" DataTextField="Descricao" DataValueField="Codigo" SelectedValue='<%# Bind("TipoUsuario") %>'>
                </asp:DropDownList>
            </InsertItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="DropDownListTipoUsuario1" runat="server" DataSourceID="SqlDataSourceDDTipoUsuario" DataTextField="Descricao" DataValueField="Codigo" SelectedValue='<%# Bind("TipoUsuario") %>'>
                </asp:DropDownList>
            </EditItemTemplate>
		</asp:TemplateField>
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
	<asp:SqlDataSource ID="SqlDataSourceUsuarioDV" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
		DeleteCommand="UsuarioD" DeleteCommandType="StoredProcedure"
		InsertCommand="UsuarioIU" InsertCommandType="StoredProcedure"
		UpdateCommand="UsuarioIU" UpdateCommandType="StoredProcedure"
		SelectCommand="View_UsuarioS" SelectCommandType="StoredProcedure">
		<SelectParameters>
			<asp:ControlParameter ControlID="GridViewUsuario" Name="Codigo" PropertyName="SelectedValue" Type="Int32" />
		</SelectParameters>
		<DeleteParameters>
			<asp:Parameter Name="Codigo" Type="Int32" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="Codigo" Type="Int32" />
			<asp:Parameter Name="CPF" Type="Double" />
			<asp:Parameter Name="Nome" Type="String" />
			<asp:Parameter Name="Login" Type="String" />
			<asp:Parameter Name="Senha" Type="String" />
			<asp:Parameter Name="email" Type="String" />
			<asp:Parameter Name="TipoUsuario" Type="Int32" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="Codigo" Type="Int32" />
			<asp:Parameter Name="CPF" Type="Double" />
			<asp:Parameter Name="Nome" Type="String" />
			<asp:Parameter Name="Login" Type="String" />
			<asp:Parameter Name="Senha" Type="String" />
			<asp:Parameter Name="email" Type="String" />
			<asp:Parameter Name="TipoUsuario" Type="Int32" />
		</UpdateParameters>
	</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSourceDDTipoUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
	SelectCommand="TipoUsuarioS2"  SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</div>

</asp:Content>
