### + ) CHALLENGE_CERTIFY ���̺� ����
	-> ���� DB ���� ������ �ۼ� �Ϸ�

### + ) certList.jsp ����

### = ) participate.jsp ���� ����Ʈ �κ�
	jsp:include (certList������(ç���� ���� LIST �Խù� ���̴� ��))
	- jsp������ ������ �Ķ���Ͱ��� no, �ش� ç����NO���� ����

### = ) participate.jsp �����ϱ� ��ư �κ�
	�� ��ü������ ����
	* button onclick�� �� ç����NO���� �Ķ���ͷ� ����

### = ) signPopup.jsp
	�� �����ϴ� ID �� ��� �ǰԲ� �߰�
	�� ç���� ���� ��� �ǰԲ� �߰� 
	�� form �±�(POST��û)�� table��� �� submit,reset��� ����

### + ) windowClose.jsp �߰� 
	-> �˾�â���� ç���� ���� �Ϸ��ϸ� �� �������� ���ε� �Ǵµ�,
	     �� ������ �׳� �������� ������ ��ũ��Ʈ�� ��������
	-> �׷��� �� ��ũ�� ���ε� �Ǹ� �˾�â�� ����!

### = ) ChallengeController -> 
	+) certList - �޼ҵ��߰� �� @GetMapping �߰�
	= ) signPopup ->@GetMapping �޼ҵ� ���� (ç����NO�Ķ���͸� ���� 
	challenge��ü�� ������, loginMember�� ���� id���� ����
	+ ) signPopup POST �޼ҵ� �߰�(service.saveCertify �޼ҵ� �߰�)

### = ) ChallengeService/impl
	+ ) saveCertify() �޼ҵ��߰�

### = ) ChallengeMapper
	+ ) insertCertify() �޼ҵ� �߰�
	
### + ) vo/ChallengeCertify.java : ç���� ���� ���̺� VO ��ü ����

### = ) challenge-mapper.xml 
	+ ) CHALLENGE_CERTIFY�� resultMap �߰�
	+ ) insert�±�(id="insertCertify" �߰�)
