<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Evento.aspx.cs" Inherits="VP.tab.Evento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

<div id="coluna1">
<h2>Tabela de Evento</h2>
<asp:ImageButton ID="ImageButtonNovo1" runat="server" ImageUrl="~/Images/insert.png" OnClick="ImageButtonNovo1_Click" Width="20px" />
<asp:GridView ID="GridViewEvento" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" PageSize=30
	CellPadding="4" ForeColor="#333333" GridLines="None" 
	DataKeyNames="Codigo" DataSourceID="SqlDataSourceEvento" EmptyDataText="Tabela sem registros."
	OnRowEditing="GridViewEvento_RowEditing" OnRowUpdated="GridViewEvento_RowUpdated" OnRowCancelingEdit="GridViewEvento_RowCancelingEdit" 
	OnSelectedIndexChanged="GridViewEvento_SelectedIndexChanged" 
	OnRowDeleted="GridViewEvento_RowDeleted" 
	>
	<Columns>
		<asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" InsertVisible="False"  ReadOnly="True" />
		<asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
		<asp:BoundField DataField="DataInicio" HeaderText="DataInicio" SortExpression="DataInicio" DataFormatString="{0:dd-M-yyyy}" />
		<asp:BoundField DataField="DataFim" HeaderText="DataFim" SortExpression="DataFim" DataFormatString="{0:dd-M-yyyy}" />
		<asp:BoundField DataField="TipoEvento" HeaderText="TipoEvento" SortExpression="TipoEvento" ReadOnly="True" Visible="False" />
		<asp:BoundField DataField="DataHora" HeaderText="DataHora" SortExpression="DataHora" Visible="False" />
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
	<asp:SqlDataSource ID="SqlDataSourceEvento" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
		DeleteCommand="EventoD" DeleteCommandType="StoredProcedure"
		InsertCommand="EventoIU" InsertCommandType="StoredProcedure"
		UpdateCommand="EventoIU" UpdateCommandType="StoredProcedure"
		SelectCommand="exec EventoS" >
		<DeleteParameters>
			<asp:Parameter Name="Codigo" Type="Int32" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="Codigo" Type="Int32" />
			<asp:Parameter Name="Descricao" Type="String" />
			<asp:Parameter Name="DataInicio" Type="DateTime" />
			<asp:Parameter Name="DataFim" Type="DateTime" />
			<asp:Parameter Name="TipoEvento" Type="Int32" />
			<asp:Parameter Name="DataHora" Type="DateTime" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="Codigo" Type="Int32" />
			<asp:Parameter Name="Descricao" Type="String" />
			<asp:Parameter Name="DataInicio" Type="DateTime" />
			<asp:Parameter Name="DataFim" Type="DateTime" />
			<asp:Parameter Name="TipoEvento" Type="Int32" />
			<asp:Parameter Name="DataHora" Type="DateTime" />
		</UpdateParameters>
	</asp:SqlDataSource>
</div>
<div = id="coluna2">
<asp:ImageButton ID="ImageButtonNovo2" runat="server" ImageUrl="~/Images/insert.png" OnClick="ImageButtonNovo2_Click" Width="20px" />
<asp:DetailsView ID="DetailsViewEvento" runat="server" AllowPaging="True" AutoGenerateRows="False"
	DataKeyNames="Codigo" DataSourceID="SqlDataSourceEventoDV" 
	OnItemDeleted="DetailsViewEvento_ItemDeleted" OnItemInserted="DetailsViewEvento_ItemInserted" OnItemUpdated="DetailsViewEvento_ItemUpdated" 
	CellPadding="4" ForeColor="#333333" GridLines="None" 
	>
	<Fields>
		<asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" InsertVisible="False"  ReadOnly="True" />
		<asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao"  />
		<asp:TemplateField HeaderText="DataInicio" SortExpression="DataInicio">
			<ItemTemplate>
				<asp:Label ID="LabelDataInicio1" runat="server" Text='<%# Bind("DataInicio","{0:dd-M-yyyy}") %>'></asp:Label>
			</ItemTemplate>
			<EditItemTemplate>
				<asp:Calendar ID="CalendarDataInicio1" runat="server" SelectedDate='<%# Bind("DataInicio") %>'></asp:Calendar>
			</EditItemTemplate>
			<InsertItemTemplate>
				<asp:Calendar ID="CalendarDataInicio2" runat="server" SelectedDate='<%# Bind("DataInicio") %>'></asp:Calendar>
			</InsertItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="DataFim" SortExpression="DataFim">
			<ItemTemplate>
				<asp:Label ID="LabelDataFim1" runat="server" Text='<%# Bind("DataFim","{0:dd-M-yyyy}") %>'></asp:Label>
			</ItemTemplate>
			<EditItemTemplate>
				<asp:Calendar ID="CalendarDataFim1" runat="server" SelectedDate='<%# Bind("DataFim") %>'></asp:Calendar>
			</EditItemTemplate>
			<InsertItemTemplate>
				<asp:Calendar ID="CalendarDataFim2" runat="server" SelectedDate='<%# Bind("DataFim") %>'></asp:Calendar>
			</InsertItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="TipoEvento" SortExpression="TipoEvento">
            <ItemTemplate>
                <asp:Label ID="Label5" runat="server" Text='<%# Bind("DesTipoEvento") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="DropDownListTipoEvento1" runat="server" DataSourceID="SqlDataSourceDDTipoEvento" DataTextField="Descricao" DataValueField="Codigo" SelectedValue='<%# Bind("TipoEvento") %>'>
                </asp:DropDownList>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:DropDownList ID="DropDownListTipoEvento2" runat="server" DataSourceID="SqlDataSourceDDTipoEvento" DataTextField="Descricao" DataValueField="Codigo" SelectedValue='<%# Bind("TipoEvento") %>'>
                </asp:DropDownList>
            </InsertItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="DataHora" SortExpression="DataHora">
			<ItemTemplate>
				<asp:Label ID="LabelDataHora1" runat="server" Text='<%# Bind("DataHora") %>'></asp:Label>
			</ItemTemplate>
			<EditItemTemplate>
			</EditItemTemplate>
			<InsertItemTemplate>
			</InsertItemTemplate>
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
	<asp:SqlDataSource ID="SqlDataSourceEventoDV" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
		DeleteCommand="EventoD" DeleteCommandType="StoredProcedure"
		InsertCommand="EventoIU" InsertCommandType="StoredProcedure"
		UpdateCommand="EventoIU" UpdateCommandType="StoredProcedure"
		SelectCommand="select * from View_Evento where Codigo = @Codigo" >
		<SelectParameters>
			<asp:ControlParameter ControlID="GridViewEvento" Name="Codigo" PropertyName="SelectedValue" Type="Int32" />
		</SelectParameters>
		<DeleteParameters>
			<asp:Parameter Name="Codigo" Type="Int32" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="Codigo" Type="Int32" />
			<asp:Parameter Name="Descricao" Type="String" />
			<asp:Parameter Name="DataInicio" Type="DateTime" />
			<asp:Parameter Name="DataFim" Type="DateTime" />
			<asp:Parameter Name="TipoEvento" Type="Int32" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="Codigo" Type="Int32" />
			<asp:Parameter Name="Descricao" Type="String" />
			<asp:Parameter Name="DataInicio" Type="DateTime" />
			<asp:Parameter Name="DataFim" Type="DateTime" />
			<asp:Parameter Name="TipoEvento" Type="Int32" />
		</UpdateParameters>
	</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSourceDDTipoEvento" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
	SelectCommand="SELECT * FROM TipoEvento ORDER BY Descricao"></asp:SqlDataSource>
</div>

</asp:Content>
