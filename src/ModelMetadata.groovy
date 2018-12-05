
class ModelMetadata {
	
	static  metadataFileLocation = "staging/modelMetadata.txt"
	static Properties props = null
	
	static repo = ""
	
	static owner = ""
	static name = ""
	static version = ""
	static description = ""
	static endpoint = ""
	
	static registryURL = ""
	static modelExecutable = ""
	
	static deployEndPoint = ""
	static deployDateTime = ""
	static deployScriptNameVersion = ""
	static deployName = ""
	static deployQualifiedName = ""
	
	
	static void loadModelMetadata(repo, localRepo){
		this.repo = repo
		
		props = new Properties()
		
		def input = new FileInputStream(localRepo +"/modelMetadata.txt")
		props.load(input)
		
		this.owner = props.getProperty("model.owner")
		this.name = props.getProperty("model.name")
		this.version = props.getProperty("model.version")
		this.description = props.getProperty("model.description")
		this.endpoint = props.getProperty("model.microservice.endpoint")
	}
	
	static loadDeployMetadata(modelRegistryPath, modelExecutable, deployHostPort, deployScriptNameVersion) {
		this.deployDateTime = new Date().format('yyyy-MM-dd_HH:mm:ss', TimeZone.getTimeZone('EST'))+"EST"
		this.deployName = "${this.name} v${this.version}"
		this.deployQualifiedName = "${this.deployName}@${deployHostPort}".replace(' ', '-')
		this.registryURL=modelRegistryPath
		this.modelExecutable=modelExecutable
		this.deployEndPoint = "http://${deployHostPort}/${this.endpoint}"
		this.deployScriptNameVersion = deployScriptNameVersion
	}

}
