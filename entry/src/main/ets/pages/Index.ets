import { NavBarView } from '../components/NavBarView'
import { getWindowAvoidArea } from '../utils/getStatusHeight'
import { common } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { TextExpandCollapse } from './Text';

@Entry
@Component
struct TransparentBarExample {
  @State scrollY: number = 0;
  scroller: Scroller = new Scroller()
  @State opNav: number = 0
  @State offsetY: number = 0
  arr: number[] = [0,1,2]
  arr1: number[] = [6,5,2,5,6,7]
  @State colorNavBar: string = ''
  private context = getContext(this) as common.UIAbilityContext

  aboutToAppear(): void {
  }

  build() {
    Column() {
      NavBarView({ opNav: this.opNav, colorNavBar: this.colorNavBar})
      // Stack() {

        Scroll(this.scroller) {
          Column() {
            Image($r('app.media.top'))
              .width('100%')
              .height(250)
              .position({x: 0, y: 0})
            Row(){
            }
            .width('100%')
            .height(200)
            .linearGradient({
              colors: [
                ['rgba(255, 255, 255, 0)', 0.6],
                ['rgba(255, 255, 255, 0.9)', 1],
              ]
            })
            TextExpandCollapse()
              .width('100%')
              .linearGradient({
                colors: [
                  ['rgba(255, 255, 255, 0.9)', 0.5],
                  ['rgba(255, 255, 255, 1)', 0.9],
                ]
              })

            Column() {

              Image($r('app.media.top'))
                .width('100%')
                .height(100)
                .borderRadius(12)
                .margin({ top: 14, bottom: 20})
              ForEach(this.arr1, (item : number) => {
                Image($r('app.media.top'))
                  .width('100%')
                  .height(180)
                Text(item.toString()).width('100%').height(200).border({width: 1, color: '#bbbbbb'})
              })
            }
            .width('100%')
            .padding(24)
          }.width('100%').backgroundColor(Color.White)

        }.onWillScroll((xOffset: number, yOffset: number) => {
          this.offsetY = this.scroller.currentOffset().yOffset;
          if (this.offsetY >= 112) {
            this.offsetY = 112
          }
          console.log('7777770',this.offsetY)
          this.opNav = this.offsetY / 112;
          console.log('7777771', this.opNav)
          this.colorNavBar = `rgba(255,255,255,${this.opNav})`
          console.log('7777772', this.colorNavBar)

        })
        .scrollBarWidth(20)
        .edgeEffect(EdgeEffect.Spring)
        .scrollBar(BarState.On)
      }
    }
  // }
}
