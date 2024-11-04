import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="header"
export default class extends Controller {
  connect() {
    if (!document.documentElement.hasAttribute("data-scroll")) {
      document.documentElement.dataset.scroll = "0";
    }
  }

  log(e) {
    const scroll = window.scrollY;
    if (scroll > 160) {
      this.element.style.opacity = 1;
    } else {
      this.element.style.opacity = 0;
    }
  }
}
