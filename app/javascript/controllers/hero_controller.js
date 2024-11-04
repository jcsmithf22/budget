import { Controller } from "@hotwired/stimulus";
import { useIntersection } from "stimulus-use";

// Connects to data-controller="hero"
export default class extends Controller {
  connect() {
    useIntersection(this, { rootMargin: "-60px 0px 0px 0px" });
    document.documentElement.dataset.showHeader = "false";
  }

  disappear(entry, observer) {
    document.documentElement.dataset.showHeader = "true";
    this.element.style.opacity = 0;
  }

  appear(entry, observer) {
    document.documentElement.dataset.showHeader = "false";
    this.element.style.opacity = 1;
  }
}
