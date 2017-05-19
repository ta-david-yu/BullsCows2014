require 'tk'

class Start
	
	
	
	#=========================================================
	def initialize
	
		#-----------------------------------------------------
		@input = TkVariable.new
		@step = 0
		@your_answer = []
		@true_answer = [*0..9].sample(4)
		
		
		#-----------------------------------------------------
#p1 = proc {validation}
		p2 = proc {update}
		
		#-----------------------------------------------------
		@gameframe = TkToplevel.new do
			title 'Game'
			minsize(200, 320)
			maxsize(200, 320)
		end
		
		@block1 = TkFrame.new(@gameframe) do #顯示框架：(200, 100)
			width 200
			height 100
			place('x'=>0, 'y'=>0)
		end
		
		
		@block2 = TkFrame.new(@gameframe) do #輸出框架：(200, 200)
			relief 'groove'
			width 200
			height 200
			borderwidth 1
			place('x'=>0, 'y'=>100)

		end
		
		@block3 = TkFrame.new(@gameframe) do #選項框架：(200, 20)
			width 200
			height 20
			place('x'=>0, 'y'=>300)
		end
		
		@entry1 = TkEntry.new(@block1) do #輸入欄
			width 20
			place('x'=>5, 'y'=>40)
#	validate 'all'
#	validatecommand p1
		
		end
		@entry1.textvariable = @input

		
		@button1 = TkButton.new(@block1) do #確認按鈕
			width 5
			text 'OK'
			place('x'=>155, 'y'=>36)
			command p2
		end
		
		@outputbox = TkListbox.new(@block2) do #紀錄表
			foreground 'yellow'
			background 'black'
			width 200
			height 200
			place('x'=>0, 'y'=>0)
		end
		
	end #初始化結束
	#=========================================================
#def validation #代號p1 用以刪除輸入碼至四個
#
#end
	#=========================================================
	def record  #紀錄玩家輸入和其結果
		@outputbox.insert 0, "#{@step}        |        #{@answer_recorder.to_s}        |        #{@a}A#{@b}B" 
	end
	#=========================================================
	def update #代號p2 用以判斷玩家輸入，並處理輸出
	
	@trans = @input.to_s
	
	@your_answer = [@trans[0].to_i, @trans[1].to_i, @trans[2].to_i, @trans[3].to_i]
		
		if @your_answer.uniq.size != 4
			warn = Tk.messageBox(
			  'type'    => "ok",  
			  'icon'    => "warning", 
			  'title'   => "Error",
			  'message' => "未輸入有效數組"
			)
		else	
			@step += 1
			@answer_recorder = @your_answer.join
			@a, @b = check
			record
			
			if @a == 4
				gameover(true)
			elsif @step ==8
				gameover(false)
			end
			
		end

	end		
	#=========================================================
	def gameover(arg) #遊戲結束，並判定輸贏
		if arg
			win = Tk.messageBox(
			  'type'    => "ok",  
			  'icon'    => "warning", 
			  'title'   => "Gameover",
			  'message' => "你贏了！ 使用步數： #{@step}"
			)
		else 
			lose = Tk.messageBox(
			  'type'    => "ok",  
			  'icon'    => "warning", 
			  'title'   => "Gameover",
			  'message' => "你輸了！ 正確答案：#{@true_answer.join}"
			)	
		end
		@gameframe.destroy
	end
	#=========================================================
	def check
		a = b = 0
		(0..3).each do |x|
			if @your_answer[x] == @true_answer[x]
				a += 1
			elsif @true_answer.include? @your_answer[x]
				b += 1
			end
		end
		return a, b
	end
			
end #class結束

