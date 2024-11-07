<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mp2.aspx.cs" Inherits="stat2018.mp2" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.17.0,  Culture=neutral,  PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">0
       <style>
       #menu {
           position: relative;
       }

           #menu.scrolling {
               position: fixed;
               top: 0;
               left: 0;
               right: 0;
           }

       @media print {

           @page {
               font-size: 7.5pt;
               size: 29cm 21.7cm;
               margin: 5mm 5mm 5mm 5mm;
           }

           .horizont {
               transform: translate(-35mm, 0) scale(0.70);
               -webkit-transform: translate(-35mm, 0) scale(0.70);
               -moz-transform: translate(-35mm, 0) scale(0.70);
           }
       }
   </style>
   <script src="Scripts/jquery-1.8.3.js"></script>

   <script src="Scripts/rls.js"></script>


       <div class="noprint">
       <div id="menu" style="background-color: #f7f7f7; z-index: 9999">
           <div class="manu_back" style="height: 40px; margin: 0 auto 0 auto; position: relative; width: 1050px; left: 0px;">
               <table>
                   <tr>
                       <td style="width: auto; padding-left: 5px;">
                           <asp:Label ID="Label4" runat="server" Text="Proszę wybrać zakres:"></asp:Label>
                       </td>
                       <td style="width: auto; padding-left: 5px;">

                    <dx:ASPxDateEdit ID="Date1" runat="server" Theme="Moderno">
                    </dx:ASPxDateEdit>
                       </td>
                       <td style="width: auto; padding-left: 5px;">

                    <dx:ASPxDateEdit ID="Date2" runat="server" Theme="Moderno">
                    </dx:ASPxDateEdit>
                       </td>
                       <td style="width: auto; padding-left: 5px;">
                           <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="LinkButton54_Click">  Odśwież</asp:LinkButton>
                       </td>
                     

                       <td style="width: auto; padding-left: 5px;">
                           <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="Button3_Click" Visible="False">Zapisz do Excel</asp:LinkButton>
                       </td>
                   </tr>
               </table>
           </div>
       </div>
   </div>
    
    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; top: 60px;">

        <div id="Div2" style="z-index: 10;">
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label ID="Label3" runat="server" Text="Sąd " Style="font-weight: 700"></asp:Label>
                <br />
            </div>

            <br />
            </div>
        <div>
            <br />
            <asp:Label ID="OpisTabeli01" runat="server"></asp:Label>


        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"  Theme="MetropolisBlue" EnableCallbackAnimation="True">
                        <SettingsPager PageSize="20">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Visible" UseFixedTableLayout="True" ShowFooter="True" />

                        <SettingsBehavior AllowSort="False" />

                        <SettingsResizing ColumnResizeMode="NextColumn" />

                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />

                        <Columns>
                            <dx:GridViewCommandColumn VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                        </Columns>

                        <TotalSummary>
                            <dx:ASPxSummaryItem  DisplayFormat="Ogółem" Visible="true" ShowInColumn="1" />
                        </TotalSummary>
     <GroupSummary>
    <dx:ASPxSummaryItem FieldName="MyField" SummaryType="Sum" DisplayFormat="{0}" />
</GroupSummary>
                        <Styles>
                            <Footer CssClass="borderAll  gray" HorizontalAlign="Center">
                            </Footer>

            <AlternatingRow BackColor="#DCDCDC">
            </AlternatingRow>
        </Styles>
                   </dx:ASPxGridView>


            <br />

            
        </div>
                <div>
            <br />
            <asp:Label ID="OpisTabeli02" runat="server"></asp:Label>


        <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False"  Theme="MetropolisBlue" EnableCallbackAnimation="True">
                        <SettingsPager PageSize="10100">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Visible" UseFixedTableLayout="True" ShowFooter="True" />

                        <SettingsBehavior AllowSort="False" />

                        <SettingsResizing ColumnResizeMode="NextColumn" />

                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />

                        <Columns>
                            <dx:GridViewCommandColumn VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                        </Columns>

                        <TotalSummary>
                            <dx:ASPxSummaryItem  DisplayFormat="Ogółem" Visible="true" ShowInColumn="1" />
                        </TotalSummary>
     <GroupSummary>
    <dx:ASPxSummaryItem FieldName="MyField" SummaryType="Sum" DisplayFormat="{0}" />
</GroupSummary>
                        <Styles>
                            <Footer CssClass="borderAll  gray" HorizontalAlign="Center">
                            </Footer>

            <AlternatingRow BackColor="#DCDCDC">
            </AlternatingRow>
        </Styles>
                   </dx:ASPxGridView>


            <br />

            
        </div>
                <div>
            <br />
            <asp:Label ID="OpisTabeli03" runat="server"></asp:Label>


        <dx:ASPxGridView ID="ASPxGridView3" runat="server" AutoGenerateColumns="False"  Theme="MetropolisBlue" EnableCallbackAnimation="True">
                        <SettingsPager PageSize="10100">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Visible" UseFixedTableLayout="True" ShowFooter="True" />

                        <SettingsBehavior AllowSort="False" />

                        <SettingsResizing ColumnResizeMode="NextColumn" />

                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />

                        <Columns>
                            <dx:GridViewCommandColumn VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                        </Columns>

                        <TotalSummary>
                            <dx:ASPxSummaryItem  DisplayFormat="Ogółem" Visible="true" ShowInColumn="1" />
                        </TotalSummary>
     <GroupSummary>
    <dx:ASPxSummaryItem FieldName="MyField" SummaryType="Sum" DisplayFormat="{0}" />
</GroupSummary>
                        <Styles>
                            <Footer CssClass="borderAll  gray" HorizontalAlign="Center">
                            </Footer>

            <AlternatingRow BackColor="#DCDCDC">
            </AlternatingRow>
        </Styles>
                   </dx:ASPxGridView>


            <br />

            
        </div>
                <div>
            <br />
            <asp:Label ID="OpisTabeli04" runat="server"></asp:Label>


        <dx:ASPxGridView ID="ASPxGridView4" runat="server" AutoGenerateColumns="False"  Theme="MetropolisBlue" EnableCallbackAnimation="True">
                        <SettingsPager PageSize="10100">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Visible" UseFixedTableLayout="True" ShowFooter="True" />

                        <SettingsBehavior AllowSort="False" />

                        <SettingsResizing ColumnResizeMode="NextColumn" />

                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />

                        <Columns>
                            <dx:GridViewCommandColumn VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                        </Columns>

                        <TotalSummary>
                            <dx:ASPxSummaryItem  DisplayFormat="Ogółem" Visible="true" ShowInColumn="1" />
                        </TotalSummary>
     <GroupSummary>
    <dx:ASPxSummaryItem FieldName="MyField" SummaryType="Sum" DisplayFormat="{0}" />
</GroupSummary>
                        <Styles>
                            <Footer CssClass="borderAll  gray" HorizontalAlign="Center">
                            </Footer>

            <AlternatingRow BackColor="#DCDCDC">
            </AlternatingRow>
        </Styles>
                   </dx:ASPxGridView>


            <br />

            
        </div>
                <div>
            <br />
            <asp:Label ID="OpisTabeli05" runat="server"></asp:Label>


        <dx:ASPxGridView ID="ASPxGridView5" runat="server" AutoGenerateColumns="False"  Theme="MetropolisBlue" EnableCallbackAnimation="True">
                        <SettingsPager PageSize="10100">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Visible" UseFixedTableLayout="True" ShowFooter="True" />

                        <SettingsBehavior AllowSort="False" />

                        <SettingsResizing ColumnResizeMode="NextColumn" />

                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />

                        <Columns>
                            <dx:GridViewCommandColumn VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                        </Columns>

                        <TotalSummary>
                            <dx:ASPxSummaryItem  DisplayFormat="Ogółem" Visible="true" ShowInColumn="1" />
                        </TotalSummary>
     <GroupSummary>
    <dx:ASPxSummaryItem FieldName="MyField" SummaryType="Sum" DisplayFormat="{0}" />
</GroupSummary>
                        <Styles>
                            <Footer CssClass="borderAll  gray" HorizontalAlign="Center">
                            </Footer>

            <AlternatingRow BackColor="#DCDCDC">
            </AlternatingRow>
        </Styles>
                   </dx:ASPxGridView>


            <br />

            
        </div>
                <div>
            <br />
            <asp:Label ID="OpisTabeli06" runat="server"></asp:Label>


        <dx:ASPxGridView ID="ASPxGridView6" runat="server" AutoGenerateColumns="False"  Theme="MetropolisBlue" EnableCallbackAnimation="True">
                        <SettingsPager PageSize="10100">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Visible" UseFixedTableLayout="True" ShowFooter="True" />

                        <SettingsBehavior AllowSort="False" />

                        <SettingsResizing ColumnResizeMode="NextColumn" />

                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />

                        <Columns>
                            <dx:GridViewCommandColumn VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                        </Columns>

                        <TotalSummary>
                            <dx:ASPxSummaryItem  DisplayFormat="Ogółem" Visible="true" ShowInColumn="1" />
                        </TotalSummary>
     <GroupSummary>
    <dx:ASPxSummaryItem FieldName="MyField" SummaryType="Sum" DisplayFormat="{0}" />
</GroupSummary>
                        <Styles>
                            <Footer CssClass="borderAll  gray" HorizontalAlign="Center">
                            </Footer>

            <AlternatingRow BackColor="#DCDCDC">
            </AlternatingRow>
        </Styles>
                   </dx:ASPxGridView>


            <br />

            
        </div>
                <div>
            <br />
            <asp:Label ID="Label8" runat="server"></asp:Label>


        <dx:ASPxGridView ID="ASPxGridView7" runat="server" AutoGenerateColumns="False"  Theme="MetropolisBlue" EnableCallbackAnimation="True">
                        <SettingsPager PageSize="10100">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Visible" UseFixedTableLayout="True" ShowFooter="True" />

                        <SettingsBehavior AllowSort="False" />

                        <SettingsResizing ColumnResizeMode="NextColumn" />

                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />

                        <Columns>
                            <dx:GridViewCommandColumn VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                        </Columns>

                        <TotalSummary>
                            <dx:ASPxSummaryItem  DisplayFormat="Ogółem" Visible="true" ShowInColumn="1" />
                        </TotalSummary>
     <GroupSummary>
    <dx:ASPxSummaryItem FieldName="MyField" SummaryType="Sum" DisplayFormat="{0}" />
</GroupSummary>
                        <Styles>
                            <Footer CssClass="borderAll  gray" HorizontalAlign="Center">
                            </Footer>

            <AlternatingRow BackColor="#DCDCDC">
            </AlternatingRow>
        </Styles>
                   </dx:ASPxGridView>


            <br />

            
        </div>
       <div id="debag">
       <br />
       <br />
       Raport statystyczny&nbsp;    &nbsp;Sporzadzone dn.
       <asp:Label ID="Label29" runat="server"></asp:Label>&nbsp;przez&nbsp;&nbsp;&nbsp;
       <asp:Label ID="Label28" runat="server"></asp:Label>
       &nbsp;<asp:Label ID="Label30" runat="server"></asp:Label>
       <br />

       <asp:Label ID="Label11" runat="server"></asp:Label>
   </div>
</asp:Content>
