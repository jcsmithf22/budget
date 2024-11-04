import { Controller } from "@hotwired/stimulus";
import { useIntersection } from "stimulus-use";
import { animate } from "motion";

// Connects to data-controller="hero"
export default class extends Controller {
  connect() {
    useIntersection(this, { rootMargin: "-60px 0px 0px 0px" });
    document.documentElement.dataset.showHeader = "false";
  }

  disappear(entry, observer) {
    document.documentElement.dataset.showHeader = "true";
    // this.element.style.opacity = 0;
    // this.element.classList.add("hide");
    animate(
      this.element,
      {
        opacity: 0,
      },
      {
        duration: 0.15,
      },
    );
  }

  appear(entry, observer) {
    document.documentElement.dataset.showHeader = "false";
    // this.element.style.opacity = 1;
    // this.element.classList.remove("hide");
    animate(
      this.element,
      {
        opacity: 1,
      },
      {
        duration: 0.15,
      },
    );
  }
}
