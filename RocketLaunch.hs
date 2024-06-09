import Graphics.UI.Gtk
import Graphics.Rendering.Chart.Easy
import Graphics.Rendering.Chart.Backend.Cairo
import Data.Time.Clock.POSIX (getPOSIXTime)

data Rocket = Rocket
  { thrust :: Double
  , fuelConsumption :: Double
  , launchSite :: (Double, Double) -- (широта, долгота)
  , launchAngle :: Double
  } deriving (Show)

main :: IO ()
main = do
  initGUI
  window <- windowNew
  set window [windowTitle := "Симулятор запуска ракеты", windowDefaultWidth := 800, windowDefaultHeight := 600]

  thrustEntry <- entryNew
  fuelEntry <- entryNew
  angleEntry <- entryNew

  thrustLabel <- labelNew (Just "Тяга (Н):")
  fuelLabel <- labelNew (Just "Расход топлива (кг/с):")
  angleLabel <- labelNew (Just "Угол запуска (градусы):")

  launchButton <- buttonNewWithLabel "Запуск"
  
  vbox <- vBoxNew False 10
  containerAdd window vbox

  boxPackStart vbox thrustLabel PackNatural 0
  boxPackStart vbox thrustEntry PackNatural 0
  boxPackStart vbox fuelLabel PackNatural 0
  boxPackStart vbox fuelEntry PackNatural 0
  boxPackStart vbox angleLabel PackNatural 0
  boxPackStart vbox angleEntry PackNatural 0
  boxPackStart vbox launchButton PackNatural 0

  on launchButton buttonActivated $ do
    thrustStr <- entryGetText thrustEntry
    fuelStr <- entryGetText fuelEntry
    angleStr <- entryGetText angleEntry

    let thrustVal = read thrustStr :: Double
    let fuelVal = read fuelStr :: Double
    let angleVal = read angleStr :: Double

    let rocket = Rocket thrustVal fuelVal (0, 0) angleVal
    print rocket

    renderableToFile def "rocket_speed_chart.png" $ do
      layout_title .= "Скорость ракеты относительно высоты"
      plot (line "скорость" [calculateSpeedData rocket])

  onDestroy window mainQuit
  widgetShowAll window
  mainGUI

calculateSpeedData :: Rocket -> [(Double, Double)]
calculateSpeedData rocket = [(h, calculateSpeed h rocket) | h <- [0,100..10000]]

calculateSpeed :: Double -> Rocket -> Double
calculateSpeed height Rocket{thrust = t, fuelConsumption = fc, launchAngle = angle} =
  let g = 9.81
      vExhaust = t / fc
      m = 50000 -- Предполагаемая постоянная масса для упрощения
      a = (t - m * g) / m
  in a * height / tan (angle * pi / 180)
