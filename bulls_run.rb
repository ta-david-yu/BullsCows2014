require 'tk'
require File.expand_path '../bulls_manual', __FILE__
require File.expand_path '../bulls_start', __FILE__


#-------------------------------------------------------------------
#                       圖形介面主架構
#-------------------------------------------------------------------
class TitleGUI
	
	def initialize
		
		$main = TkRoot.new do #程式主框
			title 'BULLS AND COWS'
			minsize(600, 400)
			maxsize(600, 400)
		end

			
		title = TkLabel.new($main) do #遊戲標題
			width 60
			height 15
			text 'BULLS AND COWS'
			foreground 'yellow'
			background 'black'
			pack('side'=>'top')
		end

		select1 = TkButton.new($main) do #選項一：開始遊戲
			width 40
			text '開始遊戲'
			pack('side'=>'top')
			command{starter = Start.new}
		end

		select2 = TkButton.new($main) do #選項二：遊戲說明
			width 40
			text '遊戲說明'
			pack('side'=>'top')
			command{Manual.new.manual_call}
		end

		select3 = TkButton.new($main) do #選項三：遊戲結束
			width 40
			text '遊戲結束'
			pack('side'=>'top')
			command{exit}
		end

		clarify1 = TkLabel.new($main) do #標籤一
			text 'made by kamisama'
			pack('side'=>'bottom')
		end

		clarify2 = TkLabel.new($main) do #標籤二
			text '暑期自我練習'
			font TkFont.new('size'=>8)
			pack('side'=>'bottom')
		end
		Tk.mainloop
	
	end

end

runner = TitleGUI.new
	




