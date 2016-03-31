using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Microsoft.SharePoint;

namespace Laboratorio2SP.VisualWebPart1
{
    public partial class VisualWebPart1UserControl : UserControl
    {
        Guid selectedSiteGuid = Guid.Empty;

        bool siteUpdated = false;

        private void AddItems()

        {
            pnlUpdateControls.Visible = false;

            var site = SPContext.Current.Site;

            lstWebs.Items.Clear();

            foreach (SPWeb web in site.AllWebs)

            {
                try

                {
                    lstWebs.Items.Add(new ListItem(web.Title, web.ID.ToString()));
                }

                finally

                {
                    web.Dispose();
                }
            }

            if (siteUpdated)

            {
                lstWebs.SelectedIndex = -1;

                selectedSiteGuid = Guid.Empty;

                pnlResult.Visible = true;
            }

            else

            {
                pnlResult.Visible = false;
            }

            if (!selectedSiteGuid.Equals(Guid.Empty))

            {
                lstWebs.Items.FindByValue(selectedSiteGuid.ToString()).Selected = true;

                pnlUpdateControls.Visible = true;
            }
        }

        protected void lstWebs_SelectedIndexChanged(object sender, EventArgs e)

        {
            selectedSiteGuid = new Guid(lstWebs.SelectedValue);

            txtTitle.Text = lstWebs.SelectedItem.Text;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)

        {
            selectedSiteGuid = new Guid(lstWebs.SelectedValue);

            string newTitle = txtTitle.Text;

            if (!String.IsNullOrEmpty(newTitle) && !selectedSiteGuid.Equals(Guid.Empty))

            {
                using (SPWeb web = SPContext.Current.Site.OpenWeb(selectedSiteGuid))

                {
                    web.Title = newTitle;

                    web.Update();

                    litResult.Text = String.Format("El titulo del sitio <i>{0}</i> se ha cambiado a <i>{1}</i>.",
                        web.Url, newTitle);
                }

                siteUpdated = true;
            }
        }

        protected override void OnPreRender(EventArgs e)

        {
            AddItems();
        }
    }
}
