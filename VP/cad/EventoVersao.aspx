<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventoVersao.aspx.cs" Inherits="VP.cad.EventoVersao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<div id="coluna1">
<h2>Cadastro de uma nova Versão do Evento</h2><br />
Evento    
    <asp:DropDownList ID="DropDownListEvento" runat="server"  AutoPostBack="True"
        DataSourceID="SqlDataSourceDDEvento"
 DataTextField="Descricao" DataValueField="Codigo" OnSelectedIndexChanged="DropDownListEvento_SelectedIndexChanged"></asp:DropDownList>
<asp:Label ID="LabelMensagem" runat="server"></asp:Label>
<asp:GridView ID="GridViewEventoVersao" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" PageSize=30
	CellPadding="4" ForeColor="#333333" GridLines="None" 
	DataKeyNames="Evento, EventoVersao" DataSourceID="SqlDataSourceEventoVersao" EmptyDataText="Tabela sem registros."
	OnRowEditing="GridViewEventoVersao_RowEditing" OnRowUpdated="GridViewEventoVersao_RowUpdated" OnRowCancelingEdit="GridViewEventoVersao_RowCancelingEdit" 
	OnSelectedIndexChanged="GridViewEventoVersao_SelectedIndexChanged" 
	OnRowDeleted="GridViewEventoVersao_RowDeleted" 
	>
	<Columns>
		<asp:BoundField DataField="Evento" HeaderText="Evento" SortExpression="Evento" ReadOnly="True" Visible="False" />
		<asp:BoundField DataField="EventoVersao" HeaderText="#" SortExpression="EventoVersao" ReadOnly="True" />
		<asp:BoundField DataField="Descricao" HeaderText="Descrição" SortExpression="Descricao" />
		<asp:BoundField DataField="DataInicio" HeaderText="Início" SortExpression="DataInicio" DataFormatString="{0:dd-M-yyyy}" />
		<asp:BoundField DataField="DataFim" HeaderText="DataFim" SortExpression="DataFim" Visible="False" DataFormatString="{0:dd-M-yyyy}" />
		<asp:BoundField DataField="DataHora" HeaderText="DataHora" SortExpression="DataHora" Visible="False" DataFormatString="{0:dd-M-yyyy}" />
		<asp:BoundField DataField="DesSituacaoEvento" HeaderText="SituacaoEvento" SortExpression="SituacaoEvento" ReadOnly="True" />
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
	<asp:SqlDataSource ID="SqlDataSourceEventoVersao" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
		DeleteCommand="EventoVersaoD" DeleteCommandType="StoredProcedure"
		InsertCommand="EventoVersaoIU" InsertCommandType="StoredProcedure"
		UpdateCommand="EventoVersaoIU" UpdateCommandType="StoredProcedure"
		SelectCommand="EventoVersaoS" SelectCommandType="StoredProcedure" >
		<SelectParameters>
			<asp:ControlParameter ControlID="DropDownListEvento" Name="Evento" PropertyName="SelectedValue" Type="Int32" />
		</SelectParameters>
		<DeleteParameters>
			<asp:Parameter Name="Evento" Type="Int32" />
			<asp:Parameter Name="EventoVersao" Type="Int32" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="Evento" Type="Int32" />
			<asp:Parameter Name="EventoVersao" Type="Int32" />
			<asp:Parameter Name="Descricao" Type="String" />
			<asp:Parameter Name="DataInicio" Type="DateTime" />
			<asp:Parameter Name="DataFim" Type="DateTime" />
			<asp:Parameter Name="SituacaoEvento" Type="Int32" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="Evento" Type="Int32" />
			<asp:Parameter Name="EventoVersao" Type="Int32" />
			<asp:Parameter Name="Descricao" Type="String" />
			<asp:Parameter Name="DataInicio" Type="DateTime" />
			<asp:Parameter Name="DataFim" Type="DateTime" />
			<asp:Parameter Name="SituacaoEvento" Type="Int32" />
		</UpdateParameters>
	</asp:SqlDataSource>
</div>
<div = id="coluna2">
<asp:ImageButton ID="ImageButtonNovo2" runat="server" ImageUrl="~/Images/insert.png" OnClick="ImageButtonNovo2_Click" Width="20px" />
<asp:DetailsView ID="DetailsViewEventoVersao" runat="server" AllowPaging="True" AutoGenerateRows="False"
	DataKeyNames="Evento,EventoVersao" DataSourceID="SqlDataSourceEventoVersaoDV" 
	OnItemDeleted="DetailsViewEventoVersao_ItemDeleted" OnItemInserted="DetailsViewEventoVersao_ItemInserted" OnItemUpdated="DetailsViewEventoVersao_ItemUpdated" 
	CellPadding="4" ForeColor="#333333" GridLines="None" OnItemInserting="DetailsViewEventoVersao_ItemInserting" 
	>
	<Fields>
		<asp:TemplateField HeaderText="Versão" SortExpression="EventoVersao">
            <EditItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("EventoVersao") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("EventoVersao") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
		<asp:BoundField DataField="Descricao" HeaderText="Descreva a versão do Evento"  SortExpression="Descricao"  />
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
		<asp:TemplateField HeaderText="DataHora" SortExpression="DataHora" InsertVisible="false">
			<ItemTemplate>
				<asp:Label ID="LabelDataHora1" runat="server" Text='<%# Bind("DataHora","{0:dd-M-yyyy}") %>'></asp:Label>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="SituacaoEvento" SortExpression="SituacaoEvento" InsertVisible="False">
            <InsertItemTemplate>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label5" runat="server" Text='<%# Bind("DesSituacaoEvento") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="DropDownListSituacaoEvento1" runat="server" DataSourceID="SqlDataSourceDDSituacaoEvento" DataTextField="Descricao" DataValueField="Codigo" SelectedValue='<%# Bind("SituacaoEvento") %>'>
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
	<asp:SqlDataSource ID="SqlDataSourceEventoVersaoDV" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
		DeleteCommand="EventoVersaoD" DeleteCommandType="StoredProcedure"
		InsertCommand="EventoVersaoIU" InsertCommandType="StoredProcedure"
		UpdateCommand="EventoVersaoIU" UpdateCommandType="StoredProcedure"
		SelectCommand="View_EventoVersaoS" SelectCommandType="StoredProcedure">
		<SelectParameters>
            <asp:ControlParameter ControlID="DropDownListEvento" Name="Evento" PropertyName="SelectedValue" Type="Int32" />
			<asp:ControlParameter ControlID="GridViewEventoVersao" Name="EventoVersao" PropertyName="SelectedDataKey.Values[EventoVersao]" Type="Int32" />
		</SelectParameters>
		<DeleteParameters>
			<asp:Parameter Name="Evento" Type="Int32" />
			<asp:Parameter Name="EventoVersao" Type="Int32" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="Evento" Type="Int32" />
			<asp:Parameter Name="EventoVersao" Type="Int32" />
			<asp:Parameter Name="Descricao" Type="String" />
			<asp:Parameter Name="DataInicio" Type="DateTime" />
			<asp:Parameter Name="DataFim" Type="DateTime" />
			<asp:Parameter Name="SituacaoEvento" Type="Int32" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="Evento" Type="Int32" />
			<asp:Parameter Name="EventoVersao" Type="Int32" />
			<asp:Parameter Name="Descricao" Type="String" />
			<asp:Parameter Name="DataInicio" Type="DateTime" />
			<asp:Parameter Name="DataFim" Type="DateTime" />
			<asp:Parameter Name="SituacaoEvento" Type="Int32" />
		</UpdateParameters>
	</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSourceDDEvento" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
	SelectCommand="EventoS2"  SelectCommandType="StoredProcedure"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSourceDDSituacaoEvento" runat="server" ConnectionString="<%$ ConnectionStrings:sistemaConnectionString %>" 
	SelectCommand="SituacaoEventoS2"  SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</div>

</asp:Content>
