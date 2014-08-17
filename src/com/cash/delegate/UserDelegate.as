package com.cash.delegate
{
	import com.cash.service.UserService;
	import com.cash.service.impl.UserServiceImpl;
	import com.cash.vo.User;
	
	import mx.rpc.IResponder;
	
	public class UserDelegate
	{
		private var responder:IResponder;
		private var userService:UserService = new UserServiceImpl();
		public function UserDelegate(responder:IResponder)
		{
			this.responder = responder;
		}
		
		//登录
		public function login(user:User):void{
			user = this.userService.findUser(user.loginName,user.password);
			if(user != null){
				this.responder.result(user);
			}else{
				this.responder.fault(user);
			}
		}
		
		//注册
		public function register(user:User):void{
			
			if(this.userService.isExists(user.loginName)){
				this.responder.fault(user);
			}else{
				this.userService.addUser(user);
				this.responder.result(user);
			}
			
		}

	}
}