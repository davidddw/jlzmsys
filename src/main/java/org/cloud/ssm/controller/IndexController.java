package org.cloud.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	@GetMapping("/datagrid.html")
    public String getDatagridPage() {
        return "example/datagrid";
    }

    @GetMapping("/accordion.html")
    public String getaccordionPage() {
        return "example/accordion";
    }

    @GetMapping("/button.html")
    public String getbuttonPage() {
        return "example/button";
    }

    @GetMapping("/dialog.html")
    public String getdialogPage() {
        return "example/dialog";
    }

    @GetMapping("/form.html")
    public String getformPage() {
        return "example/form";
    }

    @GetMapping("/layout.html")
    public String getlayoutPage() {
        return "example/layout";
    }

    @GetMapping("/menu.html")
    public String getmenuPage() {
        return "example/menu";
    }
    @GetMapping("/message.html")
    public String getmessagePage() {
        return "example/message";
    }
    @GetMapping("/other.html")
    public String getotherPage() {
        return "example/other";
    }
    @GetMapping("/panel.html")
    public String getpanelPage() {
        return "example/panel";
    }
    @GetMapping("/tabs.html")
    public String gettabsPage() {
        return "example/tabs";
    }
    @GetMapping("/tree.html")
    public String gettreePage() {
        return "example/tree";
    }
    @GetMapping("/window.html")
    public String getwindowPage() {
        return "example/window";
    }
}
