import { common, UIAbility } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';

/**
 * 获取系统状态栏，导航栏高度
 * @param context
 * @returns
 */
export async function getWindowAvoidArea(context: common.UIAbilityContext): Promise<window.AvoidArea | null> {
  try {
    const mainWindow = await window.getLastWindow(context);
    const avoidAreaType = window.AvoidAreaType.TYPE_SYSTEM; // 系统默认区域，包括状态栏，导航栏
    const avoidArea = mainWindow.getWindowAvoidArea(avoidAreaType);
    const height = avoidArea.topRect.height;
    return avoidArea
  } catch (e) {
    console.log('getWindowAvoidArea fail');
    return null
  }
}