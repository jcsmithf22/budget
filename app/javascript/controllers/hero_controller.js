import { Controller } from "@hotwired/stimulus";
// import { useIntersection } from "stimulus-use";
// import { animate } from "motion";

// Connects to data-controller="hero"
export default class extends Controller {
  connect() {
    // useIntersection(this, { rootMargin: "-60px 0px 0px 0px" });
    document.documentElement.dataset.showHeader = "false";
  }

  toggle() {
    const scroll = window.scrollY;
    const limit = 152;

    if (
      scroll > limit &&
      document.documentElement.dataset.showHeader == "false"
    ) {
      this.disappear();
    } else if (
      scroll <= limit &&
      document.documentElement.dataset.showHeader == "true"
    ) {
      this.appear();
    }
  }

  disappear() {
    document.documentElement.dataset.showHeader = "true";
    this.element.style.opacity = 0;
    // this.element.classList.add("fade-out");
    // this.element.classList.remove("fade-in");
    // animate(
    //   this.element,
    //   {
    //     opacity: 0,
    //   },
    //   {
    //     duration: 0.15,
    //   },
    // );
  }

  appear() {
    document.documentElement.dataset.showHeader = "false";
    this.element.style.opacity = 1;
    // this.element.classList.remove("hide");
    // this.element.classList.remove("fade-out");
    // this.element.classList.add("fade-in");
    // animate(
    //   this.element,
    //   {
    //     opacity: 1,
    //   },
    //   {
    //     duration: 0.15,
    //   },
    // );
  }
}
