<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="oktkr.aspx.cs" Inherits="Statystyki_2018.oktkr" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.17.0,  Culture=neutral,  PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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

       
    </style>
    <link href="style/oktkr.css" rel="stylesheet" />
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
                            <asp:LinkButton ID="LinkButton54" runat="server" CssClass="ax_box" OnClick="LinkButton54_Click">  Odśwież</asp:LinkButton>
                        </td>
                        <td style="width: auto; padding-left: 5px;">
                            <asp:LinkButton ID="LinkButton55" runat="server" OnClick="LinkButton55_Click"> Drukuj </asp:LinkButton>
                        </td>
                        <td style="width: auto; padding-left: 5px;">

                            <asp:LinkButton ID="LinkButton56" runat="server" OnClick="Button1_Click" CssClass="ax_box" Visible="False">DRUKUJ</asp:LinkButton>
                        </td>
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
                <br />
            </div>
        </div>
        <div id="zalatwienia" class="tabela1">
            <br />

            <asp:Label ID="tabela1Label" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Label ID="infoLabel2" runat="server" Text="Tabela 1\/" Visible="False"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCreated="GridView1_RowCreated"
                Width="1150px" ShowHeader="False" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                        <ItemStyle CssClass="col_25" />
                    </asp:BoundField>

                    <asp:TemplateField HeaderText="imie" SortExpression="imie">

                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_200" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_02" SortExpression="d_02">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                <asp:Label ID="Label201" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_02" SortExpression="d_02">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                <asp:Label ID="Label202" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_03">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                <asp:Label ID="Label203" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_04">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                <asp:Label ID="Label204" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_05">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                <asp:Label ID="Label205" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_06">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                <asp:Label ID="Label206" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                                <asp:Label ID="Label207" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')">
                                <asp:Label ID="Label208" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')">
                                <asp:Label ID="Label209" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')">
                                <asp:Label ID="Label210" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')">
                                <asp:Label ID="Label211" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')">
                                <asp:Label ID="Label212" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')">
                                <asp:Label ID="Label213" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')">
                                <asp:Label ID="Label214" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_07" SortExpression="d_07">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!2"%>')">
                                <asp:Label ID="Label215" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle Font-Bold="True" HorizontalAlign="Center" Wrap="False" />
                <HeaderStyle Wrap="False" />
                <RowStyle Wrap="False" />
            </asp:GridView>
            <br />
            <br />
        </div>

        <div id="tab2" class="tabela2 page-break ">
            <br />

            <asp:Label ID="tabela2Label" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Label ID="Label5" runat="server" Text="Tabela 2\/" Visible="False"></asp:Label>
            <br />
            <asp:GridView ID="tabela_2" runat="server" OnRowCreated="naglowekTabeli_tabela_2" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_tabela_2" Width="100%" ShowHeader="False" ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                        <ItemStyle Width="15px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_150" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                <asp:Label ID="Label_tabela_2101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                <asp:Label ID="Label_tabela_2102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                <asp:Label ID="Label_tabela_2103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                <asp:Label ID="Label_tabela_2104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                <asp:Label ID="Label_tabela_2105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                <asp:Label ID="Label_tabela_2106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                                <asp:Label ID="Label_tabela_2107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')">
                                <asp:Label ID="Label_tabela_2108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_09" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')">
                                <asp:Label ID="Label_tabela_2109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_10" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')">
                                <asp:Label ID="Label_tabela_2110" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')">
                                <asp:Label ID="Label_tabela_2111" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_12" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')">
                                <asp:Label ID="Label_tabela_2112" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_13" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')">
                                <asp:Label ID="Label_tabela_2113" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_14" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')">
                                <asp:Label ID="Label_tabela_2114" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_15" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!2"%>')">
                                <asp:Label ID="Label_tabela_2115" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_15" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!2"%>')">
                                <asp:Label ID="Label_tabela_2116" runat="server" Text='<%# Eval("d_16")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <br />
        </div>
    </div>

    <div id="tab3" class="page-break horizont" style="padding-left: 20px; padding-top: 30px;top: 50px;">
        <br />

        <asp:Label ID="tabela3Label" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Label ID="Label9" runat="server" Text="Tabela 3\/" Visible="False"></asp:Label>
        <br />
        <asp:GridView ID="tabela_3" runat="server" OnRowCreated="naglowekTabeli_tabela_3" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_tabela_3" Width="100%" ShowHeader="False" ShowFooter="True">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                    <ItemStyle Width="15px" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="imie" SortExpression="imie">
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                        <asp:Label ID="Label13" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_90_min" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                            <asp:Label ID="Label_tabela_3101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                            <asp:Label ID="Label_tabela_3102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                            <asp:Label ID="Label_tabela_3103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                            <asp:Label ID="Label_tabela_3104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                            <asp:Label ID="Label_tabela_3105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                            <asp:Label ID="Label_tabela_3106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                            <asp:Label ID="Label_tabela_3107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')">
                            <asp:Label ID="Label_tabela_3108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_09" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')">
                            <asp:Label ID="Label_tabela_3109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_10" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')">
                            <asp:Label ID="Label_tabela_3110" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')">
                            <asp:Label ID="Label_tabela_3111" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_12" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')">
                            <asp:Label ID="Label_tabela_3112" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_13" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')">
                            <asp:Label ID="Label_tabela_3113" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_14" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')">
                            <asp:Label ID="Label_tabela_3114" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_15" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!2"%>')">
                            <asp:Label ID="Label_tabela_3115" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_16" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!2"%>')">
                            <asp:Label ID="Label_tabela_3116" runat="server" Text='<%# Eval("d_16")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_17" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!17!2"%>')">
                            <asp:Label ID="Label_tabela_3117" runat="server" Text='<%# Eval("d_17")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_18" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!18!2"%>')">
                            <asp:Label ID="Label_tabela_3118" runat="server" Text='<%# Eval("d_18")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_19" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!19!2"%>')">
                            <asp:Label ID="Label_tabela_3119" runat="server" Text='<%# Eval("d_19")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_20" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!20!2"%>')">
                            <asp:Label ID="Label_tabela_3120" runat="server" Text='<%# Eval("d_20")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_21" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!21!2"%>')">
                            <asp:Label ID="Label_tabela_3121" runat="server" Text='<%# Eval("d_21")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_22" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!22!2"%>')">
                            <asp:Label ID="Label_tabela_3122" runat="server" Text='<%# Eval("d_22")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_23" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!23!2"%>')">
                            <asp:Label ID="Label_tabela_3123" runat="server" Text='<%# Eval("d_23")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_24" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!24!2"%>')">
                            <asp:Label ID="Label_tabela_3124" runat="server" Text='<%# Eval("d_24")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_25" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!25!2"%>')">
                            <asp:Label ID="Label_tabela_3125" runat="server" Text='<%# Eval("d_25")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_26" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!26!2"%>')">
                            <asp:Label ID="Label_tabela_3126" runat="server" Text='<%# Eval("d_26")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_27" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!27!2"%>')">
                            <asp:Label ID="Label_tabela_3127" runat="server" Text='<%# Eval("d_27")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_28" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!28!2"%>')">
                            <asp:Label ID="Label_tabela_3128" runat="server" Text='<%# Eval("d_28")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_29" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!29!2"%>')">
                            <asp:Label ID="Label_tabela_3129" runat="server" Text='<%# Eval("d_29")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_30" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!30!2"%>')">
                            <asp:Label ID="Label_tabela_3130" runat="server" Text='<%# Eval("d_30")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_31" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!31!2"%>')">
                            <asp:Label ID="Label_tabela_3131" runat="server" Text='<%# Eval("d_31")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="d_32" SortExpression="d_01">
                    <ItemTemplate>
                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!32!2"%>')">
                            <asp:Label ID="Label_tabela_3132" runat="server" Text='<%# Eval("d_32")%>' CssClass="normal"></asp:Label>
                        </a>
                    </ItemTemplate>
                    <ItemStyle CssClass="col_23 center" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <br />
    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; top: 60px;" >
        <div id="debag">
            <br />
            <br />
            Raport statystyczny
                     <asp:Label ID="Label27" runat="server"></asp:Label>
            &nbsp;Sporzadzone dn.
            <asp:Label ID="Label29" runat="server"></asp:Label>&nbsp;przez &nbsp;
            <asp:Label ID="Label28" runat="server"></asp:Label>
            &nbsp;<asp:Label ID="Label30" runat="server"></asp:Label>
            <br />

            <asp:Label ID="Label11" runat="server"></asp:Label>
        </div>

        <br />
    </div>
</asp:Content>