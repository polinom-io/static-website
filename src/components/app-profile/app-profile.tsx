import { Component, Prop, h } from "@stencil/core";
import { MatchResults } from "@stencil/router";

@Component({
  tag: "app-profile",
  styleUrl: "app-profile.css",
  shadow: true
})
export class AppProfile {
  @Prop() match: MatchResults;

  normalize(name: string): string {
    if (name) {
      return name.substr(0, 1).toUpperCase() + name.substr(1).toLowerCase();
    }
    return "";
  }

  render() {
    const name = this.match?.params?.name;
    if (name) {
      return (
        <div class="app-profile">
          <p>
            Hello! My name is {this.normalize(name)}. My name was passed in
            through a route param!
          </p>
          <stencil-route-link url="/">
            <button>Home page</button>
          </stencil-route-link>
        </div>
      );
    }
  }
}
