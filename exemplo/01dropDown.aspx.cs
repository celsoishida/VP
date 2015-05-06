using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class exe_01dropDown : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonSelecao_Click(object sender, EventArgs e)
    {
        TextBoxCodigo.Text = DropDownListCidade.SelectedItem.Value;
        TextBoxDescricao.Text = DropDownListCidade.SelectedItem.Text;

    }
}