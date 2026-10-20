type Coord = (Int, Int)

data Cell = Dead | Alive
  deriving (Eq, Show)

type Board = [[Cell]]

type Rule = Int -> Cell -> Cell

emptyBoard :: Int -> Int -> Board
emptyBoard n m = replicate n (replicate m Dead)

charToCell :: Char -> Cell
charToCell '*' = Alive
charToCell '.' = Dead

parseBoard :: String -> Board
parseBoard s = map (map charToCell) (lines s)

cellToChar :: Cell -> Char
cellToChar Alive = '*'
cellToChar Dead = '.'

showBoard :: Board -> String
showBoard b = unlines (map (map cellToChar) b)

dimensions :: Board -> (Int, Int)
dimensions b = (length b, length (b !! 0))

cellAt :: Board -> Coord -> Cell
cellAt b (x, y)
  | (x < 0) || (x >= length b) || (y < 0) || (y >= length (b !! 0)) = Dead
  | otherwise = (b !! x) !! y

countAliveNeighbors :: Board -> Coord -> Int
countAliveNeighbors b (r, c) =
  length [ (dr, dc) | dr <- [-1, 0, 1]
                    , dc <- [-1, 0, 1]
                    , (dr, dc) /= (0, 0)
                    , cellAt b (r + dr, c + dc) == Alive ]

conwayRule :: Rule
conwayRule n cell
  | cell == Alive && n > 1 && n < 4 = Alive
  | cell == Dead && n == 3 = Alive
  | otherwise = Dead

highLifeRule :: Rule
highLifeRule n cell
  | cell == Alive && n > 1 && n < 4 = Alive
  | cell == Dead && (n == 3 || n == 6) = Alive
  | otherwise = Dead

seedsRule :: Rule
seedsRule n cell
  | cell == Dead && n == 2 = Alive
  | otherwise = Dead

dayNightRule :: Rule
dayNightRule n cell
  | cell == Dead && elem n [3,6,7,8] = Alive
  | cell == Alive && elem n [3,4,6,7,8] = Alive
  | otherwise = Dead

step :: Rule -> Board -> Board
step rule b = map linhaNova [0 .. linhas - 1]
  where
    (linhas, colunas) = dimensions b
    linhaNova r       = map (celulaNova r) [0 .. colunas - 1]
    celulaNova r c    = rule (countAliveNeighbors b (r, c)) (cellAt b (r, c))

main :: IO ()
main = do
  print (emptyBoard 2 3)
  print (charToCell '*')
  print (charToCell '.')
  print (parseBoard ".*.\n*..")
  print (cellToChar Alive)
  putStr (showBoard (parseBoard ".*.\n*.."))
  let s = ".*.\n*..\n"
  print (showBoard (parseBoard s) == s)

  let t = parseBoard ".*.\n*.."
  print (cellAt t (0, 1))
  print (cellAt t (1, 0))
  print (cellAt t (0, 0))
  print (cellAt t (-1, 0))
  print (cellAt t (1, 3))

  let cruz = parseBoard ".*.\n***\n.*."
  print (countAliveNeighbors cruz (1, 1))
  print (countAliveNeighbors cruz (0, 0))
  print (countAliveNeighbors cruz (0, 1))

  print (conwayRule 2 Alive)
  print (conwayRule 3 Alive)
  print (conwayRule 1 Alive)
  print (conwayRule 4 Alive)
  print (conwayRule 3 Dead)
  print (conwayRule 2 Dead)

  print (highLifeRule 6 Dead)
  print (highLifeRule 3 Dead)
  print (highLifeRule 6 Alive)
  print (highLifeRule 2 Alive)

  print (seedsRule 2 Dead)
  print (seedsRule 2 Alive)
  print (seedsRule 3 Dead)

  print (dayNightRule 6 Dead)
  print (dayNightRule 4 Dead)
  print (dayNightRule 4 Alive)
  print (dayNightRule 2 Alive)

  let blinkerV = parseBoard ".....\n..*..\n..*..\n..*..\n....."
  let blinkerH = parseBoard ".....\n.....\n.***.\n.....\n....."
  putStrLn "--- blinker antes:"
  putStr (showBoard blinkerV)
  putStrLn "--- blinker depois de 1 step:"
  putStr (showBoard (step conwayRule blinkerV))
  print (step conwayRule blinkerV == blinkerH)
  print (step conwayRule blinkerH == blinkerV)
