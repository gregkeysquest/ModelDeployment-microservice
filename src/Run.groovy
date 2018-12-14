

class Run {
	
	static devMode = true
	static deployScriptNameVersion = "MLeapMicroserviceDeploy v1.0"
	
	static repoCreds="xxx"
	
	static deployHostPort="localhost:65327"
	
	static hdfsRegistryRoot="/user/model_registry"
	static hdfsHostName="xxx"
	
	static atlasCreds = "xxx"
	static atlasHost="xxx"
	
	static processBuilder = null
	
	
	static main(args) {
		
		def repo = args[0]
		def tmp = "tmp"
		def localRepo="${tmp}/${repo}"
		
		
		
		println "\n [STEP 1] ..... downloading repo to tmp: repo=${repo}"
		processBuilder = new ProcessBuilder("shellScripts/pullRepo.sh",
			repo,
			repoCreds).inheritIO().start().waitFor()

			
			
		println "\n [internal] ..... gathering model metadata from repo"
		ModelMetadata.loadModelMetadata(repo,localRepo)
		
		
		
		
		def modelRegistryPath="hdfs://${hdfsHostName}:8020${hdfsRegistryRoot}/${repo}"
		
		println "\n [STEP 2] ..... copying tmp to model registry: modelRegistryPath=${modelRegistryPath}"
		processBuilder = new ProcessBuilder("shellScripts/pushToRegistry.sh",
			repo,
			modelRegistryPath,
			devMode.toString()).inheritIO().start().waitFor()
			
			
			
			
		def modelExecutable=new File("tmp/${repo}/executable").listFiles()[0].getName()
		
		println "\n [STEP 3] ..... deploying model to microservice: modelToDeploy=${modelExecutable}"
		processBuilder = new ProcessBuilder("shellScripts/deployModel.sh",
			repo,
			deployHostPort,
			modelExecutable).inheritIO().start().waitFor()
			
			
			
		
		println "\n [internal] ..... gathering model deploy metadata"
		ModelMetadata.loadDeployMetadata(modelRegistryPath,
			modelExecutable,
			deployHostPort,
			deployScriptNameVersion)

		
		
		
		println "\n [STEP 4] ..... deploying Atlas entity to ${atlasHost}"
		processBuilder = new ProcessBuilder("shellScripts/createAtlasModelEntity.sh",
			atlasCreds,
			atlasHost,
			ModelMetadata.deployQualifiedName,
			ModelMetadata.deployName,
			ModelMetadata.owner,
			ModelMetadata.name,
			ModelMetadata.version,
			ModelMetadata.description,
			ModelMetadata.modelExecutable,
			ModelMetadata.registryURL,
			ModelMetadata.deployEndPoint,
			ModelMetadata.deployDateTime,
			ModelMetadata.deployScriptNameVersion).inheritIO().start().waitFor()
	}
}
