using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using System.Diagnostics;

namespace VP.tab
{
    public partial class Evento : System.Web.UI.Page
    {
        protected void ImageButtonNovo1_Click(object sender, ImageClickEventArgs e)
        {
            DetailsViewEvento.ChangeMode(DetailsViewMode.Insert);
        }

        protected void ImageButtonNovo2_Click(object sender, ImageClickEventArgs e)
        {
            DetailsViewEvento.ChangeMode(DetailsViewMode.Insert);
        }

        protected void DetailsViewEvento_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            GridViewEvento.DataBind();
        }
        protected void DetailsViewEvento_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            GridViewEvento.DataBind();
        }
        protected void DetailsViewEvento_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridViewEvento.DataBind();
        }

        protected void GridViewEvento_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            DetailsViewEvento.DataBind();
        }
        protected void GridViewEvento_SelectedIndexChanged(object sender, EventArgs e)
        {
            DetailsViewEvento.ChangeMode(DetailsViewMode.Edit);
            DetailsViewEvento.DataBind();
        }
        protected void esconderDetailsViewEvento(bool esconder)
        {
            DetailsViewEvento.Visible = esconder;
            ImageButtonNovo2.Visible = esconder;
        }
        protected void GridViewEvento_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            DetailsViewEvento.DataBind();
        }
        protected void GridViewEvento_RowEditing(object sender, GridViewEditEventArgs e)
        {
            esconderDetailsViewEvento(false);
        }
        protected void GridViewEvento_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            esconderDetailsViewEvento(true);
        }


    }
}