import { Component, OnInit } from '@angular/core';
import {HttpRequestService} from './http-request.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent implements OnInit {
  title = 'my-home-web';
  path = '/personen';

  public data: any;

  constructor(private api: HttpRequestService) {
  }

  ngOnInit() {
    let apiBaseUrl = window.location.protocol + "//" + window.location.hostname + ":8080";

    this.api
      .getPersonen(apiBaseUrl + this.path)
      .subscribe(
        data => {
          console.log(data);
          this.data = data;
        },
        err => {
          console.log(err);
        }
      );
  }
}
