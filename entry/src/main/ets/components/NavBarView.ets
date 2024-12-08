@Component
export struct NavBarView {
  @Prop opNav:number;
  @Prop colorNavBar:string;
  private navHeight:number = 56;
  // navItemClick:(index)=>void

  build() {
    Column() {
      Column()
        .width('100%')
        .height(55)
        .zIndex(1)
        .height(this.navHeight)
     Row() {
       Stack({ alignContent: Alignment.Start }) {
         Stack() {
           Image($r('app.media.icon_back'))
             .width(24)
             .height(24)
             .onClick(() => {
               // this.navItemClick(0)
             })
         }
         .width(34)
         .height(34)
         .margin({ left: 15, right: 15 })

       }

       Text('Add Expense')
         .fontSize(15)
         .fontColor(this.opNav === 1 ? Color.Black : Color.Red)
         .textAlign(TextAlign.Center)
         .width(120)
         .height(34)

       Stack() {
         Image($r('app.media.icon_more'))
           .width(24)
           .height(24)
       }
       .width(34)
       .height(34)
       .borderRadius(17)
       .margin({ left: 15, right: 15 })
     }
     .height(this.navHeight)
     .width('100%')
     .justifyContent(FlexAlign.SpaceBetween)
    }
    .position({x: 0, y: 0})
    .width('100%')
    .backgroundColor(this.colorNavBar)
    .zIndex(1)
  }
}