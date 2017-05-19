require 'tk'

class Manual
	
	def manual_call  #執行遊戲說明
	
		begin
			$manual.destroy
		rescue
		end
		
output = <<OUTPUT
遊戲一開始，隨機生成一組四碼有順序的數組。
玩家的目的就是猜出此數組在有限的步驟內。

每次回答，電腦會以幾 XAYB 的方式給予線索
A 前面的數字 標示正確的數字且位置也正確的數目
B 前面的數字 表示正確的數字但位置不正確的數目
OUTPUT
	
		$manual = TkToplevel.new do #彈出遊戲說明視窗
			title 'Manual'
			minsize(300, 200)
			maxsize(300, 200)
		end	
		
		explain = TkLabel.new($manual) do #說明書
			text output 
			pack('padx'=>10,'pady'=>10,'side'=>'top')
		end
		
		leave = TkButton.new($manual) do #離開
			text '關閉'
			pack('side'=>'top')
			command{$manual.destroy}
		end
		
	end
	
end