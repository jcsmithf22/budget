import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="header"
export default class extends Controller {
  static targets = ["container"];

  connect() {
    if (!document.documentElement.hasAttribute("data-scroll")) {
      document.documentElement.dataset.hideHero = "false";
    }
  }

  log(e) {
    const scroll = window.scrollY;
    // console.log(scroll);
    if (scroll > 156) {
      this.containerTarget.style.opacity = 1;
      document.documentElement.dataset.hideHero = "true";
    } else {
      this.containerTarget.style.opacity = 0;
      document.documentElement.dataset.hideHero = "false";
    }
    if (scroll > 275) {
      this.element.classList.add("blurred");
    } else {
      this.element.classList.remove("blurred");
    }
  }
}
