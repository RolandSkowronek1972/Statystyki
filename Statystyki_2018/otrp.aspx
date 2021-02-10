<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="otrp.aspx.cs" Inherits="Statystyki_2018.otrp" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.17.0,  Culture=neutral,  PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="Scripts/rls.js"></script>
   
            <script src="Scripts/custom.js"></script>

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
                                    <asp:LinkButton ID="LinkButton54" runat="server" CssClass="ax_box" OnClick="LinkButton54_Click">  Odśwież</asp:LinkButton>
                                </td>

                                <td style="width: auto; padding-left: 5px;">

                                    <input id="Button1" class="ax_box" style="border-style: none; padding: 0px;" type="button" onclick="window.print();" value="Drukuj" /></td>
                                <td style="width: auto; padding-left: 5px;">
                                    <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="Button3_Click">Zapisz do Excel</asp:LinkButton>
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
                    </div>
                    <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                    </div>
                    <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                        <asp:Label ID="id_dzialu" runat="server" Visible="False"></asp:Label>
                        <br />
                    </div>

                    <asp:Label ID="Label5" runat="server"></asp:Label>

                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"
                        OnRowCreated="GridView2_RowCreated" DataSourceID="dane_do_tabeli_1"
                        Width="100%" ShowHeader="False" DataKeyNames="opis,d_01,d_02,d_03,d_04,d_05,d_06,d_07,d_08,d_09,d_10,d_11,d_12,d_13,d_14,d_15,id_tabeli">
                        <Columns>
                            <asp:TemplateField HeaderText="opis" SortExpression="opis">

                                <ItemTemplate>
                                    <itemstyle cssclass="t1_opis" />
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("opis") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!1!1"%>')">
                                        <asp:Label ID="Label101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="t1_d5" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!2!1"%>')">
                                        <asp:Label ID="Label102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="t1_d5" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!3!1"%>')">
                                        <asp:Label ID="Label103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="t1_d5" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!4!1"%>')">
                                        <asp:Label ID="Label104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="t1_d5" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!5!1"%>')">
                                        <asp:Label ID="Label105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="t1_d5" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!6!1"%>')">
                                        <asp:Label ID="Label106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="t1_d5" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_")+ "!"+Eval("id_tabeli") +"!7!1"%>')">
                                        <asp:Label ID="Label107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="t1_d5" BackColor="#cccccc" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                    <asp:SqlDataSource ID="dane_do_tabeli_1" runat="server"
                        ConnectionString="<%$ ConnectionStrings:wap %>"
                        SelectCommand="SELECT DISTINCT id_, opis, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, id_tabeli
FROM            tbl_statystyki_tbl_01
WHERE        (id_dzialu = @id_dzialu) AND (id_tabeli = 1)
ORDER BY id_">
                        <SelectParameters>
                            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div id="zalatwienia" class="page-break">
                    <br />

                    <asp:Label ID="Label19" runat="server"></asp:Label>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                        DataSourceID="statystyki" OnRowCreated="grvMergeHeader_RowCreated"
                        Width="100%" ShowHeader="False">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                                <ItemStyle Width="15px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="funkcja" HeaderText="funkcja"
                                SortExpression="funkcja">
                                <ItemStyle CssClass="t2_funkcja" />
                            </asp:BoundField>
                            <asp:BoundField DataField="stanowisko" HeaderText="stanowisko"
                                SortExpression="stanowisko">
                                <ItemStyle CssClass="t2_stanowisko" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="imie" SortExpression="imie">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("imie") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                                    &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="t2_nazwisko" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                        <asp:Label ID="Label201" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="t2_d5" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                        <asp:Label ID="Label202" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="t2_d5" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                        <asp:Label ID="Label203" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="t2_d5" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                        <asp:Label ID="Label204" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="t2_d5" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                        <asp:Label ID="Label205" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="t2_d5" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                        <asp:Label ID="Label206" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="t2_d5" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                                        <asp:Label ID="Label207" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="t2_d5" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_08" SortExpression="d_08">

                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')">
                                        <asp:Label ID="Label208" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="t2_d5" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_09" SortExpression="d_09">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')">
                                        <asp:Label ID="Label209" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="t2_d5" BackColor="#CCCCCC" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_10" SortExpression="d_10">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')">
                                        <asp:Label ID="Label210" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>

                                <ItemStyle CssClass="t2_d5" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="d_10" SortExpression="d_10">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')">
                                        <asp:Label ID="Label211" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>

                                <ItemStyle CssClass="t2_d5" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="d_10" SortExpression="d_10">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')">
                                        <asp:Label ID="Label212" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>

                                <ItemStyle CssClass="t2_d5" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                    <asp:SqlDataSource ID="statystyki" runat="server"
                        ConnectionString="<%$ ConnectionStrings:wap %>"
                        SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id, ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 2) AND (id_dzialu = @id_dzialu) ORDER BY id">
                        <SelectParameters>
                            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                </div>
                <div id="wyznaczenia" class="page-break">
                    &nbsp;<asp:Label ID="Label17" runat="server"></asp:Label>
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False"
                        DataSourceID="tabela_3" OnRowCreated="GridView3_RowCreated" Width="100%" ShowHeader="False">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                                <ItemStyle Width="15px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="funkcja" HeaderText="funkcja"
                                SortExpression="funkcja">
                                <ItemStyle CssClass="t3_funkcja" />
                            </asp:BoundField>
                            <asp:BoundField DataField="stanowisko" HeaderText="stanowisko"
                                SortExpression="stanowisko">
                                <ItemStyle CssClass="t3_stanowisko" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="nazwisko" SortExpression="nazwisko">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("nazwisko") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                                    &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="t3_nazwisko" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                        <asp:Label ID="Label301" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="t3_d5" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                        <asp:Label ID="Label302" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="t3_d5" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                        <asp:Label ID="Label303" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="t3_d5" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                        <asp:Label ID="Label304" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="t3_d5" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                        <asp:Label ID="Label305" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="t3_d5" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_06" SortExpression="d_06">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                        <asp:Label ID="Label306" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="t3_d5" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                                        <asp:Label ID="Label307" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="t3_d5" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_08" SortExpression="d_08">
                                <ItemTemplate>

                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')">
                                        <asp:Label ID="Label308" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="t3_d5" BackColor="#CCCCCC" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    &nbsp;<asp:SqlDataSource ID="tabela_3" runat="server"
                        ConnectionString="<%$ ConnectionStrings:wap %>"
                        SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id,  ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 3) AND (id_dzialu = @id_dzialu) ORDER BY id">
                        <SelectParameters>
                            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>

                <br />
                <div id="Div1" class="page-break">
                    &nbsp;<asp:Label ID="Label15" runat="server"></asp:Label>
                    &nbsp;
    &nbsp;<asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False"
        DataSourceID="tabela_4" OnRowCreated="GridView4_RowCreated" Width="100%" ShowHeader="False">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                <ItemStyle Width="15px" />
            </asp:BoundField>
            <asp:BoundField DataField="funkcja" HeaderText="funkcja"
                SortExpression="funkcja">
                <ItemStyle CssClass="t4_funkcja" />
            </asp:BoundField>
            <asp:BoundField DataField="stanowisko" HeaderText="stanowisko"
                SortExpression="stanowisko">
                <ItemStyle CssClass="t4_stanowisko" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="nazwisko" SortExpression="nazwisko">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox28" runat="server" Text='<%# Bind("nazwisko") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label14" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label13" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle CssClass="t4_nazwisko" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                        <asp:Label ID="Label401" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                    </a>
                </ItemTemplate>
                <ItemStyle CssClass="t4_d5" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_02" SortExpression="d_02">
                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                        <asp:Label ID="Label402" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                    </a>
                </ItemTemplate>
                <ItemStyle CssClass="t4_d5" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_03" SortExpression="d_03">
                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                        <asp:Label ID="Label403" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                    </a>
                </ItemTemplate>
                <ItemStyle CssClass="t4_d5" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_04" SortExpression="d_04">
                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                        <asp:Label ID="Label404" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                    </a>
                </ItemTemplate>
                <ItemStyle CssClass="t4_d5" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_05" SortExpression="d_05">
                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                        <asp:Label ID="Label405" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                    </a>
                </ItemTemplate>
                <ItemStyle CssClass="t4_d5" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                        <asp:Label ID="Label406" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                    </a>
                </ItemTemplate>
                <ItemStyle CssClass="t4_d5" />
            </asp:TemplateField>
            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="d_08" SortExpression="d_08">
                <ItemTemplate>
                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                        <asp:Label ID="Label407" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                    </a>
                </ItemTemplate>
                <ItemStyle CssClass="t4_d5" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
                    <asp:SqlDataSource ID="tabela_4" runat="server"
                        ConnectionString="<%$ ConnectionStrings:wap %>"
                        SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id, ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, sesja, id_sedziego, id_tabeli FROM tbl_statystyki_tbl_02 WHERE  (id_tabeli = 4) AND (id_dzialu = @id_dzialu) ORDER BY id">
                        <SelectParameters>
                            <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div id="Div8" class="page-break">
                        <br />
                        Raport statystyczny
                    <asp:Label ID="Label27" runat="server"></asp:Label>
                        &nbsp;Sporzadzone dn.
            <asp:Label ID="Label29" runat="server"></asp:Label>&nbsp;przez&nbsp;
&nbsp;&nbsp;
            <asp:Label ID="Label28" runat="server"></asp:Label>
                        &nbsp;<asp:Label ID="Label30" runat="server"></asp:Label>
                        <br />
                    </div>
                    <br />
                </div>
                <div id="debag">
                    <asp:Label ID="Label11" runat="server"></asp:Label>
                    <br />
                </div>
            </div>
</asp:Content>