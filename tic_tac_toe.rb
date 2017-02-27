class TicTacToe

Win_Combinations=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]] 

def initialize
	puts "Hi! Welceome to Tic Tac Toe!"
	board=["0","1","2","3","4","5","6","7","8"]
	display_board(board)
	turn(board)
end
def  display_board(board)                                #print出棋盤長相  
    
    puts "-----------"        
	puts " #{board[0]} | #{board[1]} | #{board[2]}"
	puts "-----------"
	puts " #{board[3]} | #{board[4]} | #{board[5]}"
	puts "-----------"
	puts " #{board[6]} | #{board[7]} | #{board[8]}"
	puts "-----------"
end
	
def turn(board)                                          #輸入數字在棋盤上作記號	
	until x_won?(board)|| o_won?(board) || draw?(board) do 
	puts "Please choose availiable square"
   	i=gets.chomp.to_i
   		if !valid_move?(board,i)||!valid_input?(i)
   		puts"Invalid Input!!!"
   		turn(board) 
   		end
   		move(board,i,current_player(board))
   		display_board(board)
   	end
   	puts "Draw!!!! Game Over!!!" if draw?(board)
   	puts "Player X won!!! Game Over!!!" if x_won?(board)
   	puts "Player O won!!! Game Over!!!" if o_won?(board)
end
def move(board,i,current_player)             #輸入的數字看是哪個玩家就輸入哪種記號
	board[i]=current_player(board)
end
def current_player(board)                   #看現在是誰玩
 	turn_count(board)%2==0? "X" : "O"
end
def turn_count(board)                       #算被填滿"X"或"o"的有幾個
	board.count{|taken| taken=="X"||taken=="O"}
end	

def position_taken?(board,i)  #確認有沒有被填過
	board[i].eql? "O"||"X" 
end

def x_won?(board)          #怎麼樣算贏了 	
	Win_Combinations.any?{|com| com.all?{|square| board[square]=="X"}}
end

def o_won?(board)
	Win_Combinations.any?{|com| com.all?{|square| board[square]=="O"}}
end
def valid_move?(board,i)  #確認動作可不可以成立
	!position_taken?(board,i)
end
def valid_input?(i)
    return true if i==0||i==1||i==2||i==3||i==4||i==5||i==6||i==7||i==8
end	

def full?(board)    #確認有沒有被填滿
	board.all?{|square| square=="X" || square=="O" }
end

def draw?(board)        #沒有人贏且填滿了才算平手
	!x_won?(board)&& !o_won?(board) &&full?(board)
end

end

start=TicTacToe.new
